{ lib, pkgs, ... }:
{
  name = "larapaper";

  meta.maintainers = with lib.maintainers; [
    gepbird
  ];

  nodes = {
    larapaper =
      { ... }:
      {
        services.larapaper = {
          enable = true;
          hostName = "localhost";
          appKeyFile = toString (
            pkgs.writeText "larapaper-app-key" "base64:zzPXBQPlgn0NHwVBTVG0B//8P/PVwVnBp2gk0ZWR0+k="
          );
          nginx.forceSSL = false;
        };
      };
  };

  testScript = ''
    start_all()

    larapaper.wait_for_unit("larapaper-setup.service")
    larapaper.wait_for_unit("phpfpm-larapaper.service")
    larapaper.wait_for_unit("nginx.service")
    larapaper.wait_for_open_port(80)

    larapaper.succeed("curl --fail http://localhost/login")

    larapaper.wait_for_unit("larapaper-queue.service")

    larapaper.succeed("systemctl start larapaper-scheduler.service")
    larapaper.succeed(
        "systemctl show -P Result larapaper-scheduler.service | grep -q success"
    )

    with subtest("generated device screens are servable by nginx"):
        larapaper.succeed(
            "mkdir -p /var/lib/larapaper/storage/app/public"
            + " && echo -n hello-from-dataDir > /var/lib/larapaper/storage/app/public/probe.txt"
            + " && chown larapaper:nginx /var/lib/larapaper/storage/app/public/probe.txt"
        )
        larapaper.succeed(
            "curl --fail http://localhost/storage/probe.txt | grep -q hello-from-dataDir"
        )

    with subtest("Flux/Livewire's dynamically-routed JS isn't shadowed by static asset caching"):
        # Flux and Livewire both serve their core JS via a Laravel route
        # (e.g. /flux/flux.js), not a real file under public/. A static
        # asset location matching by file extension alone would 404 this
        # instead of falling through to PHP-FPM, silently breaking every
        # Alpine/Flux-driven UI element while server-rendered HTML/CSS
        # keeps working fine.
        larapaper.succeed("curl --fail --silent --show-error --output /dev/null http://localhost/flux/flux.js")

    with subtest("Browsershot/Chromium rendering actually works"):
        # Exercises the real rendering pipeline (Browsershot -> Node ->
        # Puppeteer -> Chromium) against already-seeded device models,
        # rather than just checking that services start. This would have
        # caught node_modules (needed for `require("puppeteer")`) being
        # stripped from the package.
        larapaper.succeed("larapaper images:generate-defaults")

        # Same command again, but under the exact hardening larapaper-queue
        # runs with, since that's the unit that actually renders images in
        # production and Chromium's process/sandbox model can conflict with
        # systemd sandboxing in ways a plain CLI run wouldn't catch.
        larapaper.succeed(
            "systemd-run --pipe --wait --uid=larapaper --gid=nginx"
            " -p ProtectSystem=strict -p ReadWritePaths=/var/lib/larapaper"
            " -p PrivateTmp=yes -p PrivateDevices=yes -p ProtectHome=tmpfs"
            " -p ProtectKernelTunables=yes -p ProtectKernelModules=yes"
            " -p ProtectKernelLogs=yes -p ProtectControlGroups=yes"
            " -p ProtectClock=yes -p ProtectHostname=yes -p ProtectProc=invisible"
            " -p ProcSubset=pid -p 'RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6'"
            " -p RestrictNamespaces=yes -p LockPersonality=yes -p RestrictRealtime=yes"
            " -p RestrictSUIDSGID=yes -p RemoveIPC=yes -p NoNewPrivileges=yes"
            " -p CapabilityBoundingSet= -p SystemCallArchitectures=native -p UMask=0077"
            " -- larapaper images:generate-defaults --force"
        )
  '';
}
