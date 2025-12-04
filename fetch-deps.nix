let
  flake = builtins.getFlake (toString ./.);
  pkgs = flake.legacyPackages.x86_64-linux;
  lib = pkgs.lib;
  updateScripts = [
    flake.legacyPackages.x86_64-linux.alda.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.apkeditor.passthru.deps.arsclib.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.apkeditor.passthru.deps.jcommand.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.apkeditor.passthru.deps.smali.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.apksigner.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.armitage.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.atlauncher.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.bandcamp-collection-downloader.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.cie-middleware-linux.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.coulomb.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.ed-odyssey-materials-helper.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.fastddsgen.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.freenet.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.freeplane.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.freerouting.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.ghidra.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.ghidra-extensions.ghidra-delinker-extension.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.ghidra-extensions.kaiju.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.gpx-animator.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.gradle-dependency-tree-diff.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.jabref.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.jadx.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.java-hamcrest.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.json2cdn.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.key.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.keyboard-layout-editor.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.keyguard.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.keyspersecond.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.libeufin.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.marytts.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.mindustry.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.modrinth-app-unwrapped.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.mucommander.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.nextflow.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.openjfx.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.pakku.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.pdftk.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.pkl.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.rhino.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.scenic-view.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.rkpd2.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.rat-king-adventure.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.experienced-pixel-dungeon.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.summoning-pixel-dungeon.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.shorter-pixel-dungeon.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.tower-pixel-dungeon.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.simple-binary-encoding.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.slimevr-server.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.stirling-pdf.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.structurizr-cli.mitmCache.updateScript
    flake.legacyPackages.x86_64-linux.velocity.mitmCache.updateScript
  ];
in
flake.legacyPackages.x86_64-linux.stdenv.mkDerivation {
    name = "foo";
    phases = ["installPhase"];
    installPhase = (lib.concatStringsSep ";" (map (script: "echo ${script} >> $out") updateScripts));
}
#updateScripts
