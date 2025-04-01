{
  stdenvNoCC,
  pnpm_9,
}:

stdenvNoCC.mkDerivation {
  name = "test-pnpm-deps";

  nativeBuildInputs = [
    pnpm_9
  ];

  unpackPhase = ''
    echo $PATH
    pnpm --version
  '';
}
