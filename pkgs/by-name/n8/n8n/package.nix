{
  stdenv,
  lib,
  nixosTests,
  fetchFromGitHub,
  nodejs,
  pnpm,
  jq,
  moreutils,
  python3,
  nodePackages,
  cacert,
  xcbuild,
  libkrb5,
  libmongocrypt,
  postgresql,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "n8n";
  version = "1.45.1";

  src = fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${finalAttrs.version}";
    hash = "sha256-4Lxygi8LyBFoudNJYmo6wzswmtuv5uBm48eCuJm9hRw=";
  };

  # this can be removed when pnpm in nixpkgs is new enough for n8n
  patchPhase = ''
    runHook prePatch

    jq '.packageManager = "pnpm@${pnpm.version}"' package.json | sponge package.json

    runHook postPatch
  '';

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-uYyBrTanu1OLb57GqBzl8suysOW79oEmpQUSiw5Zx/c=";
  };

  nativeBuildInputs = [
    pnpm.configHook
    jq
    moreutils # required for sponge
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
