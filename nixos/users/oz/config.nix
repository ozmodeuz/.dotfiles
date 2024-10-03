{ config, pkgs, ... }:

{
  home.username = "oz";
  home.homeDirectory = "/home/oz";
  home.sessionVariables = {
    EDITOR = "micro";
  };
  home.stateVersion = "24.05"; # don't change :)

  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
            "appindicatorsupport@rgcjonas.gmail.com"
            "arcmenu@arcmenu.com"
            "dash-to-panel@jderose9.github.com"
            "display-configuration-switcher@knokelmaat.gitlab.com"
            "gsconnect@andyholmes.github.io"
            "mediacontrols@cliffniff.github.com"
            "tailscale@joaophi.github.com"
            "user-theme-x@tuberry.github.io"
        ];
    };
    settings."org/gnome/shell/extensions/arcmenu" = {
      all-apps-button-action = "All_Programs";
      #application-shortcuts = [{'id': 'org.gnome.Terminal.desktop'}, {'id': 'org.gnome.Settings.desktop'}, {'id': 'ArcMenu_Software', 'name': 'Software'}, {'id': 'org.gnome.tweaks.desktop'}, {'id': 'com.mattjakeman.ExtensionManager.desktop', 'name': 'Extensions'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Overview', 'icon': 'view-fullscreen-symbolic'}]
      arc-menu-icon = 71;
      #context-menu-items=[{'id': 'ArcMenu_Settings', 'name': 'ArcMenu Settings', 'icon': 'ArcMenu_ArcMenuIcon'}, {'id': 'ArcMenu_PanelExtensionSettings', 'name': 'Panel Extension Settings', 'icon': 'application-x-addon-symbolic'}, {'id': 'com.mattjakeman.ExtensionManager.desktop'}, {'id': 'ArcMenu_Separator', 'name': 'Separator', 'icon': 'list-remove-symbolic'}, {'id': 'ArcMenu_PowerOptions', 'name': 'Power Options', 'icon': 'system-shutdown-symbolic'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Activities Overview', 'icon': 'view-fullscreen-symbolic'}, {'id': 'ArcMenu_ShowDesktop', 'name': 'Show Desktop', 'icon': 'computer-symbolic'}]
      custom-menu-button-icon-size = 34.0;
      default-menu-view = "Frequent_Apps";
      distro-icon = 0;
      hide-overview-on-startup = true;
      menu-button-appearance = "Icon";
      menu-button-icon = "Distro_Icon";
      multi-monitor = true;
      position-in-panel = "Center";
      #power-options=[(0, true), (1, true), (4, true), (2, true), (3, true), (5, false), (6, false), (7, false)]
      prefs-visible-page = 0;
      # search-entry-border-radius = (true, 25)
      show-activities-button = false;
      vert-separator = true;
    };
    settings."org/gnome/shell/extensions/dash-to-panel" = {
      #animate-appicon-hover-animation-extent={'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}
      appicon-margin = 3;
      appicon-padding = 6;
      #available-monitors=[0, 1]
      dot-color-1 = "#976ea0";
      dot-color-2 = "#976ea0";
      dot-color-3 = "#976ea0";
      dot-color-4 = "#976ea0";
      dot-color-dominant = false;
      dot-color-override = true;
      dot-color-unfocused-different = false;
      dot-position = "BOTTOM";
      dot-size = 4;
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      focus-highlight= true;
      focus-highlight-color = "#ffffff";
      focus-highlight-dominant = false;
      focus-highlight-opacity = 20;
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      middle-click-action = "LAUNCH";
      panel-anchors = [
        "0:MIDDLE"
        "1:MIDDLE"
      ];
      #panel-element-positions = {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'
      panel-lengths = [
        "0:100"
        "1:100"
      ];
      panel-sizes = [
        "0:48"
        "1:48"
      ];
      primary-monitor = 0;
      shift-click-action = "LAUNCH";
      shift-middle-click-action = "LAUNCH";
      status-icon-padding = -1;
      trans-bg-color = "#e5b8d9";
      trans-gradient-bottom-opacity = 0.1;
      trans-gradient-top-color = "#ffffff";
      trans-gradient-top-opacity = 0.1;
      trans-panel-opacity= 0.7;
      trans-use-custom-bg = true;
      trans-use-custom-gradient = true;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-light";
      cursor-theme = "Yaru";
      gtk-theme = "Yaru-magenta";
      icon-theme = "Yaru-magenta";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # this ain't workin.
  gtk.iconTheme.name = "Yaru-magenta";
  gtk.iconTheme.package = pkgs.yaru-theme;
  gtk.theme.name = "Yaru-magenta";
  gtk.theme.package = pkgs.yaru-theme;

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
}
