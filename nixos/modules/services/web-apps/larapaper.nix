{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    isAttrs
    isString
    mkEnableOption
    mkPackageOption
    mkOption
    optionalString
    types
    literalExpression
    recursiveUpdate
    mkIf
    mkDefault
    mkForce
    mkMerge
    escapeShellArgs
    hashString
    readFile
    ;

  cfg = config.services.larapaper;

  user = cfg.user;
  group = cfg.group;

  defaultUser = "larapaper";
  defaultGroup = "larapaper";

  tlsEnabled = cfg.nginx.addSSL || cfg.nginx.forceSSL || cfg.nginx.onlySSL || cfg.nginx.enableACME;

  larapaper = cfg.package.override { inherit (cfg) dataDir; };

  phpPackage = larapaper.php;

  artisan =
    (pkgs.writeShellScriptBin "larapaper" ''
      cd "${larapaper}"
      exec ${phpPackage}/bin/php artisan "$@"
    '').overrideAttrs
      (old: {
        meta = old.meta // {
          mainProgram = "larapaper";
        };
      });

  # Applied to larapaper-setup and larapaper-scheduler. Deliberately NOT
  # applied to larapaper-queue: it's the one unit that actually spawns
  # headless Chromium (via Browsershot, for every device screen render),
  # and Chromium's own process/sandboxing model can conflict with several
  # of these restrictions.
  hardening = {
    ProtectSystem = "strict";
    ReadWritePaths = [ cfg.dataDir ];
    PrivateTmp = true;
    PrivateDevices = true;
    ProtectHome = "tmpfs";
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectKernelLogs = true;
    ProtectControlGroups = true;
    ProtectClock = true;
    ProtectHostname = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    RestrictAddressFamilies = "AF_UNIX AF_INET AF_INET6";
    RestrictNamespaces = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RemoveIPC = true;
    NoNewPrivileges = true;
    CapabilityBoundingSet = "";
    SystemCallFilter = [
      "@system-service"
      "~@privileged"
      "~@resources"
    ];
    SystemCallArchitectures = "native";
    UMask = "0077";
  };

  isSecret = v: isAttrs v && v ? _secret && (isString v._secret || builtins.isPath v._secret);

  larapaperEnvVars = lib.generators.toKeyValue {
    mkKeyValue = lib.flip lib.generators.mkKeyValueDefault "=" {
      mkValueString =
        v:
        with builtins;
        if isInt v then
          toString v
        else if isString v then
          "\"${v}\""
        else if true == v then
          "true"
        else if false == v then
          "false"
        else if isSecret v then
          if (isString v._secret) then
            hashString "sha256" v._secret
          else
            hashString "sha256" (builtins.readFile v._secret)
        else
          throw "unsupported type ${typeOf v}: ${(lib.generators.toPretty { }) v}";
    };
  };
in
{
  options.services.larapaper = {
    enable = mkEnableOption "LaraPaper, a self-hosted BYOS (Bring Your Own Server) for TRMNL e-ink displays";

    package = mkPackageOption pkgs "larapaper" { };

    user = mkOption {
      default = defaultUser;
      description = "User larapaper runs as.";
      type = types.str;
    };

    group = mkOption {
      default = if config.services.nginx.enable then config.services.nginx.group else defaultGroup;
      defaultText = literalExpression "if config.services.nginx.enable then config.services.nginx.group else \"larapaper\"";
      description = "Group larapaper runs as.";
      type = types.str;
    };

    hostName = mkOption {
      type = types.str;
      default = config.networking.fqdnOrHostName;
      defaultText = literalExpression "config.networking.fqdnOrHostName";
      example = "trmnl.example.com";
      description = ''
        The hostname to serve LaraPaper on.
      '';
    };

    appURL = mkOption {
      type = types.str;
      default = "http${optionalString tlsEnabled "s"}://${cfg.hostName}";
      defaultText = literalExpression "http(s)://\${config.services.larapaper.hostName}";
      example = "https://trmnl.example.com";
      description = ''
        The root URL that you want to host LaraPaper on. All URLs (including
        firmware/image links given to devices) will be generated using this
        value.
      '';
    };

    appKeyFile = mkOption {
      type = types.path;
      description = ''
        A file containing the Laravel `APP_KEY` - a 32 character long,
        base64 encoded key used for encryption. Generate one with:
        `echo "base64:$(head -c 32 /dev/urandom | base64)"`.
      '';
      example = "/run/secrets/larapaper-app-key";
    };

    dataDir = mkOption {
      description = "larapaper data directory. Holds the SQLite database, uploaded firmwares, and generated device screens.";
      default = "/var/lib/larapaper";
      type = types.path;
    };

    proxyRefreshMinutes = mkOption {
      type = types.ints.positive;
      default = 15;
      description = ''
        How often (in minutes) larapaper polls trmnl.app for devices that
        are proxying through to the official TRMNL cloud instead of being
        fully self-hosted.
      '';
    };

    passkeysEnabled = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to enable WebAuthn passkey login support.";
    };

    registrationEnabled = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to allow new users to register an account.";
    };

    logLevel = mkOption {
      type = types.enum [
        "emergency"
        "alert"
        "critical"
        "error"
        "warning"
        "notice"
        "info"
        "debug"
      ];
      default = "warning";
      description = "Laravel log level.";
    };

    chromiumPackage = mkOption {
      type = types.package;
      default = pkgs.chromium;
      defaultText = literalExpression "pkgs.chromium";
      description = ''
        Chromium (or Chrome) package used by Browsershot/Puppeteer to render
        plugin markup to PNG for e-ink devices. This is a hard runtime
        dependency: every device screen refresh renders through headless
        Chrome. On weak or aarch64 hosts, building `pkgs.chromium` from
        source may be very slow if no binary substitute is available.
      '';
    };

    maxUploadSize = mkOption {
      type = types.str;
      default = "20M";
      description = "The maximum size for uploads (e.g. firmware images).";
    };

    poolConfig = mkOption {
      type = types.attrsOf (
        types.oneOf [
          types.str
          types.int
          types.bool
        ]
      );
      default = { };
      description = ''
        Options for the larapaper PHP pool. See the documentation on
        `php-fpm.conf` for details on configuration directives.
      '';
    };

    config = mkOption {
      type = types.attrsOf (
        types.oneOf [
          types.bool
          types.int
          types.str
          (types.submodule {
            options._secret = mkOption {
              type = types.either types.str types.path;
              description = ''
                The path to a file containing the value the option should be
                set to in the final `.env` file.
              '';
            };
          })
        ]
      );
      default = { };
      example = literalExpression ''
        {
          MAIL_MAILER = "smtp";
          MAIL_HOST = "smtp.example.com";
          MAIL_USERNAME = "trmnl@example.com";
          MAIL_PASSWORD._secret = "/run/secrets/larapaper-smtp-password";
        }
      '';
      description = ''
        Extra options to set in larapaper's `.env` file, on top of the ones
        this module already derives from its own options. Refer to
        <https://github.com/usetrmnl/larapaper/blob/main/.env.example> for
        the full list of supported values.

        Settings containing secret data should be set to an attribute set
        containing the attribute `_secret` - a string pointing to a file
        containing the value the option should be set to.
      '';
    };

    nginx = mkOption {
      type = types.submodule (
        recursiveUpdate (import ../web-servers/nginx/vhost-options.nix { inherit config lib; }) { }
      );
      default = { };
      example = literalExpression ''
        {
          serverAliases = [ "trmnl.''${config.networking.domain}" ];
          forceSSL = true;
          enableACME = true;
        }
      '';
      description = ''
        Customization options for the larapaper nginx virtual host.
      '';
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ artisan ];

    services.larapaper.config = {
      APP_NAME = mkDefault "LaraPaper";
      APP_ENV = mkDefault "production";
      APP_KEY._secret = cfg.appKeyFile;
      APP_URL = cfg.appURL;
      APP_DEBUG = mkDefault false;
      LOG_CHANNEL = mkDefault "stderr";
      LOG_LEVEL = cfg.logLevel;
      DB_CONNECTION = mkDefault "sqlite";
      DB_DATABASE = mkDefault "${cfg.dataDir}/database.sqlite";
      SESSION_DRIVER = mkDefault "database";
      CACHE_STORE = mkDefault "database";
      QUEUE_CONNECTION = mkDefault "database";
      FORCE_HTTPS = tlsEnabled;
      TRMNL_PROXY_REFRESH_MINUTES = cfg.proxyRefreshMinutes;
      PASSKEYS_ENABLED = cfg.passkeysEnabled;
      REGISTRATION_ENABLED = cfg.registrationEnabled;
      PUPPETEER_MODE = mkDefault "local";
      PUPPETEER_EXECUTABLE_PATH = mkDefault "${cfg.chromiumPackage}/bin/chromium";
    };

    services.phpfpm.pools.larapaper = {
      inherit user group;
      phpPackage = phpPackage;
      phpOptions = ''
        log_errors = on
        opcache.enable = 1
        post_max_size = ${cfg.maxUploadSize}
        upload_max_filesize = ${cfg.maxUploadSize}
      '';
      settings = {
        "listen.mode" = mkDefault "0660";
        "listen.owner" = mkDefault user;
        "listen.group" = mkDefault group;
        "pm" = mkDefault "dynamic";
        "pm.max_children" = mkDefault 32;
        "pm.start_servers" = mkDefault 2;
        "pm.min_spare_servers" = mkDefault 2;
        "pm.max_spare_servers" = mkDefault 4;
        "pm.max_requests" = mkDefault 500;
      }
      // cfg.poolConfig;
    };

    services.nginx = {
      enable = mkDefault true;
      recommendedTlsSettings = mkDefault true;
      recommendedOptimisation = mkDefault true;
      recommendedGzipSettings = mkDefault true;
      virtualHosts.${cfg.hostName} = mkMerge [
        cfg.nginx
        {
          root = mkForce "${larapaper}/public";
          locations = {
            "/" = {
              index = "index.php";
              tryFiles = "$uri $uri/ /index.php?$query_string";
            };
            "~ \\.php$" = {
              extraConfig = ''
                include ${config.services.nginx.package}/conf/fastcgi_params;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                fastcgi_pass unix:${config.services.phpfpm.pools.larapaper.socket};
                ${optionalString tlsEnabled "fastcgi_param HTTPS on;"}
              '';
            };
            # Scoped to Vite's own build output on purpose, rather than a
            # blanket file-extension regex: Livewire and Flux both register
            # their core JS as dynamic Laravel routes that happen to end in
            # ".js" (e.g. /flux/flux.js, see vendor/livewire/flux/src/
            # AssetManager.php), not real files under public/. A regex
            # location has no PHP-FPM fallback and would 404 those routes
            # outright, silently breaking every Alpine/Flux-driven UI
            # element (dropdowns, etc.) while everything server-rendered
            # keeps working - which is exactly what happened before this
            # was scoped down.
            "^~ /build/" = {
              extraConfig = "expires 365d;";
            };
          };
        }
      ];
    };

    systemd.services.larapaper-setup = {
      description = "Preparation tasks for larapaper";
      before = [ "phpfpm-larapaper.service" ];
      requiredBy = [
        "phpfpm-larapaper.service"
        "larapaper-queue.service"
        "larapaper-scheduler.service"
      ];
      partOf = [
        "phpfpm-larapaper.service"
        "larapaper-queue.service"
        "larapaper-scheduler.service"
      ];
      restartTriggers = [ larapaper ];
      unitConfig.RequiresMountsFor = [ cfg.dataDir ];
      serviceConfig = hardening // {
        Type = "oneshot";
        RemainAfterExit = true;
        User = user;
        Group = group;
        WorkingDirectory = larapaper;
      };
      path = [ pkgs.replace-secret ];
      script =
        let
          secretPaths = lib.mapAttrsToList (_: v: v._secret) (lib.filterAttrs (_: isSecret) cfg.config);
          mkSecretReplacement = file: ''
            replace-secret ${
              escapeShellArgs [
                (if (isString file) then hashString "sha256" file else hashString "sha256" (readFile file))
                file
                "${cfg.dataDir}/.env"
              ]
            }
          '';
          secretReplacements = lib.concatMapStrings mkSecretReplacement secretPaths;
          filteredConfig = lib.filterAttrs (_: v: v != null) cfg.config;
          larapaperEnv = pkgs.writeText "larapaper.env" (larapaperEnvVars filteredConfig);
        in
        ''
          set -euo pipefail
          umask 077

          # No -o/-g here: the service already runs as ${user}:${group}, so
          # newly created files get that ownership from the kernel without
          # an explicit chown - which matters under hardening, since
          # SystemCallFilter's ~@privileged blocks fchownat outright.
          install -T -m 0600 ${larapaperEnv} "${cfg.dataDir}/.env"
          ${secretReplacements}

          if [ ! -e "${cfg.dataDir}/database.sqlite" ]; then
            install -m 0600 /dev/null "${cfg.dataDir}/database.sqlite"
          fi

          ${lib.getExe artisan} config:clear
          ${lib.getExe artisan} migrate --graceful --force
          ${lib.getExe artisan} optimize:clear
          ${lib.getExe artisan} config:cache
        '';
    };

    systemd.services.larapaper-queue = {
      description = "larapaper queue worker";
      after = [ "larapaper-setup.service" ];
      bindsTo = [ "larapaper-setup.service" ];
      wantedBy = [ "multi-user.target" ];
      # SystemCallFilter is deliberately left unset here: every real
      # example of a hardened systemd unit that spawns headless Chromium
      # (nixos/modules/services/{misc/gotenberg,web-apps/karakeep,
      # monitoring/grafana-image-renderer}.nix) either omits it entirely
      # or replaces the usual deny-list with a narrow allow-list, since
      # Chromium's own process/sandbox model can conflict with a
      # restrictive filter - this bit us on larapaper-setup too (~@privileged
      # blocked plain `install -o`/`-g`, i.e. fchownat, unrelated to Chromium
      # at all).
      serviceConfig = removeAttrs hardening [ "SystemCallFilter" ] // {
        User = user;
        Group = group;
        WorkingDirectory = larapaper;
        ExecStart = "${lib.getExe artisan} queue:work --tries=3 --max-time=3600";
        Restart = "always";
        RestartSec = "5s";
      };
    };

    systemd.services.larapaper-scheduler = {
      description = "larapaper scheduler";
      after = [ "larapaper-setup.service" ];
      bindsTo = [ "larapaper-setup.service" ];
      serviceConfig = hardening // {
        Type = "oneshot";
        User = user;
        Group = group;
        WorkingDirectory = larapaper;
        ExecStart = "${lib.getExe artisan} schedule:run";
      };
    };

    systemd.timers.larapaper-scheduler = {
      description = "Run the larapaper scheduler every minute";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "minutely";
        Unit = "larapaper-scheduler.service";
        Persistent = true;
      };
    };

    systemd.tmpfiles.settings."10-larapaper" =
      let
        defaultConfig = {
          inherit user group;
          mode = "0700";
        };
        # nginx (as `group`) reaches storage/app/public through the
        # $out/public/storage symlink, so it needs to traverse - but not
        # list - every ancestor directory in between.
        traversableConfig = defaultConfig // {
          mode = "0710";
        };
        # storage/app/public and everything under it is served directly by
        # nginx, so `group` needs to list and read here.
        publicConfig = defaultConfig // {
          mode = "0750";
        };
      in
      {
        "${cfg.dataDir}".d = traversableConfig;
        "${cfg.dataDir}/cache".d = defaultConfig;
        "${cfg.dataDir}/storage".d = traversableConfig;
        "${cfg.dataDir}/storage/app".d = traversableConfig;
        "${cfg.dataDir}/storage/app/private".d = defaultConfig;
        "${cfg.dataDir}/storage/app/public".d = publicConfig;
        "${cfg.dataDir}/storage/app/public/firmwares".d = publicConfig;
        "${cfg.dataDir}/storage/app/public/images".d = publicConfig;
        "${cfg.dataDir}/storage/app/public/images/default-screens".d = publicConfig;
        "${cfg.dataDir}/storage/app/public/images/generated".d = publicConfig;
        "${cfg.dataDir}/storage/framework".d = defaultConfig;
        "${cfg.dataDir}/storage/framework/cache".d = defaultConfig;
        "${cfg.dataDir}/storage/framework/cache/data".d = defaultConfig;
        "${cfg.dataDir}/storage/framework/sessions".d = defaultConfig;
        "${cfg.dataDir}/storage/framework/testing".d = defaultConfig;
        "${cfg.dataDir}/storage/framework/views".d = defaultConfig;
        "${cfg.dataDir}/storage/logs".d = defaultConfig;
      };

    users = {
      users = mkIf (user == defaultUser) {
        ${defaultUser} = {
          inherit group;
          isSystemUser = true;
          home = cfg.dataDir;
        };
      };
      groups = mkIf (group == defaultGroup) {
        ${defaultGroup} = { };
      };
    };
  };

  meta.maintainers = with lib.maintainers; [
    gepbird
  ];
}
