{
  lib,
  stdenvNoCC,
  fetchurl,
  nodejs,
  withNode ? true,
  pnpm_9,
  callPackage,
  ...
}:

let
  #pnpm_9-drv = stdenvNoCC.mkDerivation (finalAttrs: {
  #  pname = "pnpm";
  #  version = "9.15.9";
  #
  #  src = fetchurl {
  #    url = "https://registry.npmjs.org/pnpm/-/pnpm-${finalAttrs.version}.tgz";
  #    hash = "sha256-z4anrXZEBjldQoam0J1zBxFyCsxtk+nc6ax6xNxKKKc=";
  #  };
  #
  #  preConfigure = ''
  #    rm -r dist/reflink.*node dist/vendor
  #  '';
  #
  #  buildInputs = [ nodejs ]; # this is suspicious
  #
  #  nativeBuildInputs = [
  #    nodejs
  #  ];
  #
  #  installPhase = ''
  #    runHook preInstall
  #
  #    install -d $out/{bin,libexec}
  #    cp -R . $out/libexec/pnpm
  #    ln -s $out/libexec/pnpm/bin/pnpm.cjs $out/bin/pnpm
  #
  #    runHook postInstall
  #  '';
  #
  #  postFixup = ''
  #    cat $out/bin/pnpm
  #  '';
  #});
  #
  #pnpm_9 = callPackage ({...}:pnpm_9-drv) {};
  #
  #fetchDeps = stdenvNoCC.mkDerivation {
  #  name = "test-pnpm-deps";
  #
  #  nativeBuildInputs = [
  #    pnpm_9
  #  ];
  #
  #  unpackPhase = ''
  #    echo $PATH
  #    pnpm --version
  #  '';
  #};
in
stdenvNoCC.mkDerivation {
  pname = "pnpm-test";
  version = "unstable";

  pnpmDeps = pnpm_9.fetchDeps;

  unpackPhase = ''
    echo pnpm-test $PATH
    pnpm --version # works
    touch $out;
  '';

  nativeBuildInputs = [
    pnpm_9
  ];
}
