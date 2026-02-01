git checkout 4254839dacf917d37c79e62cbf75b1eceed0d7a0~1
nix-instantiate --raw --eval eval-urls.nix > before
git checkout 4254839dacf917d37c79e62cbf75b1eceed0d7a0
nix-instantiate --raw --eval eval-urls.nix > after
diff before after
