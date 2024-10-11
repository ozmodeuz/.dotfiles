{ config, pkgs, home-manager, ... }:

{
  home.username = "oz";
  home.homeDirectory = "/home/oz";
  home.sessionVariables = {
    EDITOR = "micro";
  };
  home.packages =
    (with pkgs; [
      # packages
      _1password
      _1password-gui
      alacritty
      coolercontrol.coolercontrol-gui
      coolercontrol.coolercontrol-liqctld
      coolercontrol.coolercontrol-ui-data
      coolercontrol.coolercontrold
      #deskflow
      eyedropper
      inkscape
      lan-mouse
      microsoft-edge
      nuclear
      pika-backup
      scribus
      vscodium
      waveterm
      # fonts
      ( nerdfonts.override {
        fonts = [
          "0xProto"
        ];
      })
      # themes
      yaru-theme
    ]);

  home.stateVersion = "24.05"; # don't change :)

  programs.bash.enable = true;

  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
    "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
  ];

  programs.firefox.enable = true;

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

  xdg.desktopEntries = {
    codium = {
      categories = ["Utility" "TextEditor" "Development" "IDE"];
      comment = "Code Editing. Redefined.";
      exec = "codium %F";
      genericName = "Text Editor";
      icon = "vscodium";
      name = "VSCodium";
      startupNotify = true;
      type = "Application";
      settings = {
        StartupWMClass = "codium-url-handler";
      };
    };
    /* chromium-browser = {
      categories = ["Network" "WebBrowser"];
      exec = ''
        chromium --profile-directory="Profile 1" --class=chromium-browser %U
      '';
      genericName = "Web Browser";
      icon = "chromium";
      name = "Chromium (Personal)";
      startupNotify = true;
      type = "Application";
      settings = {
        StartupWMClass = "chromium-browser";
      };
    };
    chromium-work = {
      categories = ["Network" "WebBrowser"];
      exec = ''
        chromium --profile-directory="Profile 2" --class=chromium-work %U
      '';
      genericName = "Web Browser";
      icon = "chromium";
      name = "Chromium (Work)";
      startupNotify = true;
      type = "Application";
      settings = {
        StartupWMClass = "chromium-work";
      }; 
    };*/
  };
}
