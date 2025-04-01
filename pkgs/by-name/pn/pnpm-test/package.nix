{
  stdenvNoCC,
  pnpm_9,
}:

let
  fetchDeps =
    { ... }:
    stdenvNoCC.mkDerivation {
      name = "test-pnpm-deps";

      nativeBuildInputs = [
        pnpm_9
      ];

      unpackPhase = ''
        echo $PATH
        pnpm --version
      '';
    };
in
stdenvNoCC.mkDerivation {
  pname = "readest";
  version = "unstable";

  pnpmDeps = fetchDeps { };
}
