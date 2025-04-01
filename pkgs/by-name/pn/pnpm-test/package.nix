{
  lib,
  stdenvNoCC,
  fetchurl,
  nodejs,
  withNode ? true,
  pnpm_9,
  ...
}:

let
  #pnpm_9 = stdenvNoCC.mkDerivation (finalAttrs: {
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
  #  buildInputs = lib.optionals withNode [ nodejs ]; # this is suspicious
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

  #pnpmDeps = fetchDeps;

  unpackPhase = ''
    pnpm --version # works
    touch $out;
  '';

  nativeBuildInputs = [
    pnpm_9
  ];
}
