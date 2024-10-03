{ config, pkgs, ... }:

{

  home.username = "oz";
  home.homeDirectory = "/home/oz";
  home.sessionVariables = {
    EDITOR = "micro";
  };

  home.stateVersion = "24.05"; # don't change :)

  programs.bash.enable = true;

  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
  ];

  programs.git.enable = true;
  programs.git.userName = "Oz Browning";
  programs.git.userEmail = "56755170+ozmodeuz@users.noreply.github.com";

  programs.home-manager.enable = true;

  programs.kitty.enable = true;
  programs.kitty.settings.copy_on_select = "no";
  programs.kitty.extraConfig = ''
    enabled_layouts Grid, Stack
    mouse_map right press ungrabbed
    mouse_map right press ungrabbed kitten paste_handler.py
  '';

  programs.micro.enable = true;

}
