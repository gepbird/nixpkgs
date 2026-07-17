{
  lib,
  fetchFromGitHub,
  fetchNpmDeps,
  nodejs,
  buildPackages,
  php84,
  dataDir ? "/var/lib/larapaper",
  nix-update-script,
}:

let
  php = php84;
in
php.buildComposerProject2 (finalAttrs: {
  pname = "larapaper";
  version = "0.39.0";

  src = fetchFromGitHub {
    owner = "usetrmnl";
    repo = "larapaper";
    tag = finalAttrs.version;
    hash = "sha256-OEuVAFbXKNxSgdKgRZXvxxLNHzM3Mo/fqEFYDdhmYDo=";
  };

  php = php.buildEnv {
    extensions = { enabled, all }: enabled ++ (with all; [ imagick ]);
  };

  vendorHash = "sha256-uKHJ3IaIGlGIJiOSGdej5fOGuaQqc8wHci3UIs7mo5U=";

  nativeBuildInputs = [
    nodejs
    buildPackages.npmHooks.npmConfigHook
  ];

  npmDeps = fetchNpmDeps {
    inherit (finalAttrs) src;
    name = "${finalAttrs.pname}-npm-deps";
    hash = "sha256-2ec9Q/zelX+nfpP158RJgpZbjKH42EBU/u0PWvVpVhs=";
  };

  preInstall = ''
    npm run build
  '';

  postInstall = ''
    chmod -R u+w $out/share
    mv $out/share/php/larapaper/* $out/
    rm -R $out/share $out/storage $out/bootstrap/cache $out/node_modules
    ln -s ${dataDir}/storage $out/storage
    ln -s ${dataDir}/cache $out/bootstrap/cache
    ln -s ${dataDir}/storage/app/public $out/public/storage
    ln -s ${dataDir}/.env $out/.env
    chmod +x $out/artisan
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Self-hosted BYOS (Bring Your Own Server) for TRMNL e-ink displays, built with Laravel";
    homepage = "https://github.com/usetrmnl/larapaper";
    changelog = "https://github.com/usetrmnl/larapaper/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      gepbird
    ];
    platforms = lib.platforms.linux;
  };
})
