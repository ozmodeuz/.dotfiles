rm new
rm result
sudo nixos-rebuild build --upgrade --flake .
mv result new
nvd diff old new
read -p "Update? Ctrl-c to quit."
sudo nixos-rebuild switch --upgrade --flake .
rm old
mv new old
sudo nix-store --gc