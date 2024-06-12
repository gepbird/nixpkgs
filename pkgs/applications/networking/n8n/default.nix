{
  stdenvNoCC,
  lib,
  nixosTests,
  fetchFromGitHub,
  nodejs,
  pnpm_8,
  xcbuild,
  libkrb5,
  libmongocrypt,
  postgresql,
  fetchurl,
}:

let
  sqliteVersion = "5.1.6";
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "n8n";
  version = "1.9.3";

  src = fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${finalAttrs.version}";
    hash = "sha256-eeIqHKl20irC6/TzfpmbsNQo/p3DjvVecRndxofQEiU=";
  };

  pnpmDeps = pnpm_8.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-LwPbKuVH1Mq11+Ayd5HiAeNCUTxNWSf0virEl8892QA=";
  };

  node-sqlite3 =
    let
      inherit (stdenvNoCC.hostPlatform) system;
      selectSystem = attrs: attrs.${system} or (throw "Unsupported system: ${system}");
      sqliteFile = selectSystem {
        x86_64-linux = "napi-v6-linux-glibc-x64.tar.gz";
        aarch64-linux = "napi-v6-linux-glibc-arm64.tar.gz";
      };
      hash = selectSystem {
        x86_64-linux = "sha256-0xR1pIcxvaUHR9QYf0bwKFZehAhkc7VeFl6eREdDAWQ=";
        aarch64-linux = "sha256-TPqUGscudurGW7Hm5GaP1clMIXnIaAxKRF93ZE6BnQg=";
      };
    in
    fetchurl {
      url = "https://github.com/TryGhost/node-sqlite3/releases/download/v${sqliteVersion}/${sqliteFile}";
      inherit hash;
    };

  nativeBuildInputs = [
    nodejs
    pnpm_8.configHook
  ] ++ lib.optional stdenvNoCC.isDarwin [
    xcbuild
  ];

  buildInputs = [
    nodejs
    libkrb5
    libmongocrypt
    postgresql
  ];

  buildPhase = ''
    runHook preBuild
    pnpm build
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{lib,bin}
    cp -r {packages,node_modules} $out/lib
    ln -s $out/lib/packages/cli/bin/n8n $out/bin/n8n

    SQLITE_FOLDER=$out/lib/node_modules/.pnpm/sqlite3@${sqliteVersion}/node_modules/sqlite3/lib/binding
    mkdir -p $SQLITE_FOLDER
    tar xf ${finalAttrs.node-sqlite3} -C $SQLITE_FOLDER

    runHook postInstall
  '';

  # makes libmongocrypt bindings not look for static libraries in completely wrong places
  BUILD_TYPE = "dynamic";

  passthru = {
    tests = nixosTests.n8n;
  };

  meta = with lib; {
    description = "Free and source-available fair-code licensed workflow automation tool. Easily automate tasks across different services";
    maintainers = with maintainers; [
      freezeboy
      gepbird
      k900
    ];
    license = licenses.sustainableUse;
    mainProgram = "n8n";
  };
})
