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
}:

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
