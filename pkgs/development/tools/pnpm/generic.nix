{
  stdenvNoCC,
  fetchurl,
  nodejs,
  withNode ? true,
  ...
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pnpm";
  version = "9.15.9";

  src = fetchurl {
    url = "https://registry.npmjs.org/pnpm/-/pnpm-${finalAttrs.version}.tgz";
    hash = "sha256-z4anrXZEBjldQoam0J1zBxFyCsxtk+nc6ax6xNxKKKc=";
  };

  preConfigure = ''
    rm -r dist/reflink.*node dist/vendor
  '';

  buildInputs = [ nodejs ]; # sus

  nativeBuildInputs = [
    nodejs
  ];

  installPhase = ''
    runHook preInstall

    install -d $out/{bin,libexec}
    cp -R . $out/libexec/pnpm
    ln -s $out/libexec/pnpm/bin/pnpm.cjs $out/bin/pnpm


    runHook postInstall
  '';

  #postFixup = ''
  #  cat $out/bin/pnpm
  #'';

  passthru.fetchDeps = stdenvNoCC.mkDerivation {
    name = "test-pnpm-deps";

    nativeBuildInputs = [
      finalAttrs.finalPackage
    ];

    unpackPhase = ''
      echo fetch-deps $PATH
      pnpm --version
    '';
  };
})
