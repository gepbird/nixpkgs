{ lib
, rustPlatform
, fetchFromGitHub
, installShellFiles
, stdenv
, darwin
, bottom
, testers
, nix-update-script
}:

rustPlatform.buildRustPackage rec {
  pname = "bottom";
  version = "0.9.7";

  src = fetchFromGitHub {
    owner = "ClementTsang";
    repo = pname;
    rev = version;
    hash = "sha256-WZf6BR0D7VDdRu9mCVd2dwPraQ8IYXQcgblwL5wqHYQ=";
  };

  cargoHash = "sha256-F0T9jbgfdu6rimIq+3ijYlkFRMkhuuQchy0o4xhCoXE=";

  nativeBuildInputs = [ installShellFiles ];

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [
    darwin.apple_sdk_11_0.frameworks.Foundation
  ];

  doCheck = true;

  preCheck = ''
    # required for integration tests
    export HOME=$(mktemp -d)
  '';

  postInstall = ''
    installManPage target/tmp/bottom/manpage/btm.1
    installShellCompletion \
      target/tmp/bottom/completion/btm.{bash,fish} \
      --zsh target/tmp/bottom/completion/_btm
  '';

  BTM_GENERATE = true;

  passthru = {
    tests.version = testers.testVersion {
      package = bottom;
    };
    updateScript = nix-update-script { };
  };

  meta = with lib; {
    description = "Cross-platform graphical process/system monitor with a customizable interface";
    homepage = "https://github.com/ClementTsang/bottom";
    changelog = "https://github.com/ClementTsang/bottom/blob/${version}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ berbiche figsoda gepbird ];
    mainProgram = "btm";
  };
}
