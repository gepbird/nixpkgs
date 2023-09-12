{ fetchFromGitHub
, lib
, libnotify
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "zsh-notify";
  version = "1.0-unstable-2023-04-30";

  src = fetchFromGitHub {
    owner = "marzocchi";
    repo = pname;
    rev = "9c1dac81a48ec85d742ebf236172b4d92aab2f3f";
    sha256 = "sha256-ovmnl+V1B7J/yav0ep4qVqlZOD3Ex8sfrkC92dXPLFI=";
  };

  strictDeps = true;
  dontBuild = true;

  runtimeDependencies = [
    libnotify
  ];

  installPhase = ''
    install -D notify.plugin.zsh $out/share/zsh/plugins/notify/notify.plugin.zsh
  '';

  meta = with lib; {
    homepage = "https://github.com/marzocchi/zsh-notify";
    license = licenses.mit;
    description = "Desktop notifications for long-running commands in zsh";
    maintainers = with maintainers; [ gepbird ];
  };
}
