{ stdenv
, lib
, nixosTests
, fetchFromGitHub
, nodejs
, pnpm_8
, xcbuild
, libkrb5
, libmongocrypt
, postgresql
, nodePackages
, python3
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "n8n";
  version = "1.29.0";

  src = fetchFromGitHub {
    owner = "n8n-io";
    repo = "n8n";
    rev = "n8n@${finalAttrs.version}";
    hash = "sha256-csaoKhprwGlhCt0IUbiKHsSIEfFvHWH+btadhVI44yY=";
  };

  pnpmDeps = pnpm_8.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-1Id7lwvfWTvHJWiETqpCXGRETxrq7b4KTQGykGDJuy8=";
  };

  nativeBuildInputs = [
    nodejs
    pnpm_8.configHook
  ] ++ lib.optional stdenv.isDarwin [
    xcbuild
  ];

  buildInputs = [
    nodejs
    libkrb5
    libmongocrypt
    postgresql

    # required to build sqlite3 bindings
    python3
    nodePackages.node-gyp
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
    maintainers = with maintainers; [
      freezeboy
      gepbird
      k900
    ];
    license = licenses.sustainableUse;
    mainProgram = "n8n";
  };
})
