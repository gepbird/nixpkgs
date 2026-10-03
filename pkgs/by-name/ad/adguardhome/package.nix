{
  lib,
  fetchFromGitHub,
  buildGo127Module,
  buildNpmPackage,
  nixosTests,
  testers,
}:

buildGo127Module (finalAttrs: {
  pname = "adguardhome";
  version = "1.0.0-b.1";
  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "AdGuardHome";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Ms4VFeBCz5Bm3vY7uAJLyAduts2ygSteGbO3JEdQJX8=";
  };

  vendorHash = "sha256-f0HILmUL3PXOO19V9f3bJJDQUSzaltXUpkv71aY4wIs=";

  dashboard = buildNpmPackage {
    inherit (finalAttrs) src version;
    pname = "adguardhome-dashboard";
    postPatch = ''
      cd client
    '';
    npmDepsHash = "sha256-Yyv8dTKhZ9IlIW/x/57cl/+cpvjjycaFLSyOR0IiIPk=";
    npmBuildScript = "build-prod";
    postBuild = ''
      mkdir -p $out/build/
      cp -r ../build/static/ $out/build/
    '';
  };

  preBuild = ''
    cp -r ${finalAttrs.dashboard}/build/static build
  '';

  ldflags = [
    "-s"
    "-w"
    "-X github.com/AdguardTeam/AdGuardHome/internal/version.version=${finalAttrs.version}"
  ];

  passthru = {
    updateScript = ./update.sh;
    schema_version = 34;
    tests.adguardhome = nixosTests.adguardhome;
    tests.version = testers.testVersion {
      package = finalAttrs.finalPackage;
    };
  };

  meta = {
    homepage = "https://github.com/AdguardTeam/AdGuardHome";
    description = "Network-wide ads & trackers blocking DNS server";
    maintainers = with lib.maintainers; [
      numkem
      iagoq
      rhoriguchi
      baksa
    ];
    license = lib.licenses.gpl3Only;
    mainProgram = "AdGuardHome";
  };
})
