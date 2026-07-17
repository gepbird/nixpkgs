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
  '';
}
