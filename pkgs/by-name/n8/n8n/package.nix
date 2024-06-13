{
  stdenv,
  lib,
  nixosTests,
  fetchFromGitHub,
  nodejs,
  pnpm_8,
  xcbuild,
  libkrb5,
  libmongocrypt,
  postgresql,
  nodePackages,
  python3,
  cacert,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "n8n";
  version = "1.44.2";

  src = fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${finalAttrs.version}";
    hash = "sha256-Ah7LD2x8yHfiUqcBn9TyIr05S8bCU7mnY1WM9Oplka8=";
  };

  pnpmDeps = pnpm_8.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-KbE1frS4mwl3KLCPprS9wSpoFaGFXvcWcNGc0xQaqIQ=";
  };

  nativeBuildInputs = [
    nodejs
    pnpm_8.configHook
    python3 # required to build sqlite3 bindings
    nodePackages.node-gyp # required to build sqlite3 bindings
    cacert # required for rustls-native-certs (dependency of turbo build tool)
  ] ++ lib.optional stdenv.isDarwin [ xcbuild ];

  buildInputs = [
    nodejs
    libkrb5
    libmongocrypt
    postgresql
  ];

  buildPhase = ''
    runHook preBuild

    pushd node_modules/sqlite3
    node-gyp rebuild
    popd

    pnpm build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{lib,bin}
    cp -r {packages,node_modules} $out/lib
    ln -s $out/lib/packages/cli/bin/n8n $out/bin/n8n

    runHook postInstall
  '';

  # makes libmongocrypt bindings not look for static libraries in completely wrong places
  BUILD_TYPE = "dynamic";

  passthru = {
    tests = nixosTests.n8n;
  };

  meta = with lib; {
    description = "Free and source-available fair-code licensed workflow automation tool. Easily automate tasks across different services";
    homepage = "https://n8n.io";
    changelog = "https://github.com/n8n-io/n8n/releases/tag/${finalAttrs.src.rev}";
    maintainers = with maintainers; [
      freezeboy
      gepbird
      k900
    ];
    license = licenses.sustainableUse;
    mainProgram = "n8n";
    platforms = lib.platforms.unix;
  };
})
