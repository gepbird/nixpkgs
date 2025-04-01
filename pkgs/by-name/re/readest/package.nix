{
  pnpm_9,
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation {
  pnpmDeps = pnpm_9.fetchDeps {
  };
}
