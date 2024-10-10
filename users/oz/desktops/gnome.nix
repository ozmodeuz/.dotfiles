{ config, pkgs, ... }:

{

nixpkgs.overlays = [
  (import ../overlays/gnome/arcmenu.nix)
  (import ../overlays/gnome/displayswitcher.nix)
];

  home.file."${config.home.homeDirectory}/.config/gnome-shell/gnome-shell-light.css".source = ../themes/gnome-shell-light.css;
  home.file."${config.home.homeDirectory}/.local/share/backgrounds/trans_wallpaper_1.png".source = ../wallpapers/trans_wallpaper_1.png;

  home.packages = with pkgs; [
    gdm-settings
    gnome-extension-manager
    gnome-software
  ];

  xdg.desktopEntries.Chromium.name = "Chromium";
  xdg.desktopEntries.Chromium.exec = "chromium --enable-features=UseOzonePlatform --ozone-platform=auto --force-device-scale-factor=2 --disable-features=WaylandFractionalScaleV1 %U";
  xdg.desktopEntries.VSCodium.name = "VSCodium";
  xdg.desktopEntries.VSCodium.exec = "VSCodium --new-window --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations %F";

  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs ; [
      { package = gnomeExtensions.appindicator; }
      { package = gnomeExtensions.arcmenu; }
      { package = gnomeExtensions.dash-to-panel; }
      { package = gnomeExtensions.display-configuration-switcher; }
      { package = gnomeExtensions.gsconnect; }
      { package = gnomeExtensions.media-controls; }
      { package = gnomeExtensions.tailscale-qs; }
      { package = gnomeExtensions.user-themes-x; }
    ];
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/oz/.local/share/backgrounds/trans_wallpaper_1.png";
      picture-uri-dark = "file:///home/oz/.local/share/backgrounds/trans_wallpaper_1.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    "org/gnome/mutter" = {
      center-new-windows = true;
      experimental-features = "['scale-monitor-framebuffer']";
      overlay-key = "Super_L";
    };
    "org/gnome/nautilus/list-view" = {
      default-column-order = [ "name" "size" "type" "owner" "group" "permissions" "date_modified" "date_accessed" "date_created" "recency" "detailed_type" ];
      default-visible-columns = [ "name" "size" "date_modified" ];
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = [ "background-logo@fedorahosted.org" "apps-menu@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "HideItems@fablevi.github.io" "blur-my-shell@aunetx" "appindicatorsupport@rgcjonas.gmail.com" "trayIconsReloaded@selfmade.pl" "status-icons@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "gsconnect@andyholmes.github.io" "dash-to-panel@jderose9.github.com" "arcmenu@arcmenu.com" "user-theme-x@tuberry.github.io" "mediacontrols@cliffniff.github.com" "arch-update@RaphaelRochet" "display-configuration-switcher@knokelmaat.gitlab.com" "rounded-window-corners@fxgn" "tailscale@joaophi.github.com" "dim-background-windows@stephane-13.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "Alacritty.desktop" "chromium-browser.desktop" "thunderbird.desktop" "VSCodium.desktop" "1password.desktop" "Affinity Photo 2.desktop" ];
    };
    "org/gnome/shell/extensions/arcmenu" = {
      all-apps-button-action = "All_Programs";
      application-shortcuts = "[{'id': 'org.gnome.Settings.desktop'}, {'id': 'ArcMenu_Software', 'name': 'Software'}, {'id': 'org.gnome.tweaks.desktop'}, {'id': 'com.mattjakeman.ExtensionManager.desktop', 'name': 'Extensions'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Overview', 'icon': 'view-fullscreen-symbolic'}]";
      arc-menu-icon = 71;
      context-menu-items = "[{'id': 'ArcMenu_Settings', 'name': 'ArcMenu Settings', 'icon': 'ArcMenu_ArcMenuIcon'}, {'id': 'ArcMenu_PanelExtensionSettings', 'name': 'Panel Extension Settings', 'icon': 'application-x-addon-symbolic'}, {'id': 'com.mattjakeman.ExtensionManager.desktop'}, {'id': 'ArcMenu_Separator', 'name': 'Separator', 'icon': 'list-remove-symbolic'}, {'id': 'ArcMenu_PowerOptions', 'name': 'Power Options', 'icon': 'system-shutdown-symbolic'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Activities Overview', 'icon': 'view-fullscreen-symbolic'}, {'id': 'ArcMenu_ShowDesktop', 'name': 'Show Desktop', 'icon': 'computer-symbolic'}]";
      custom-menu-button-icon-size = 34.0;
      default-menu-view = "Frequent_Apps";
      distro-icon = 0;
      hide-overview-on-startup = true;
      menu-button-appearance = "Icon";
      menu-button-icon = "Distro_Icon";
      multi-monitor = true;
      position-in-panel = "Center";
      power-options = "[ (mkTuple [ 0 true ]) (mkTuple [ 1 true ]) (mkTuple [ 4 true ]) (mkTuple [ 2 true ]) (mkTuple [ 3 true ]) (mkTuple [ 5 false ]) (mkTuple [ 6 false ]) (mkTuple [ 7 false ]) ]";
      prefs-visible-page = 0;
      show-activities-button = true;
      vert-separator = true;
    };
    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 3;
      appicon-padding = 6;
      available-monitors = [ 0 ];
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
      focus-highlight = true;
      focus-highlight-color = "#ffffff";
      focus-highlight-dominant = false;
      focus-highlight-opacity = 20;
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      middle-click-action = "LAUNCH";
      panel-anchors = ''
        {"0":"MIDDLE","1":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"centerMonitor"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';
      panel-lengths = ''
        {"0":100,"1":100}
      '';
      panel-sizes = ''
        {"0":48,"1":48}
      '';
      primary-monitor = 0;
      shift-click-action = "LAUNCH";
      shift-middle-click-action = "LAUNCH";
      status-icon-padding = -1;
      trans-bg-color = "#e5b8d9";
      trans-gradient-bottom-opacity = 0.1;
      trans-gradient-top-color = "#ffffff";
      trans-gradient-top-opacity = 0.1;
      trans-panel-opacity = 0.7000000000000001;
      trans-use-custom-bg = true;
      trans-use-custom-gradient = true;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };
    "org/gnome/shell/extensions/display-configuration-switcher" = {
      config = ''
        [('Work', uint32 522154615, 
          [(0, 0, 1.5, uint32 0, true, [('DP-0', '3840x2160@59.997', @a{sv} {})])], 
          {'layout-mode': <uint32 3>}, 
          [('DP-0', 'DEL', 'DELL G3223Q', '6BX70P3'), ('HDMI-0', 'DEL', 'DELL U2520D', 'H4MM923')]
        ), 
        ('Personal', 2225729516, 
          [(0, 0, 1.5, 0, true, [('DP-0', '3840x2160@59.997', {})]), 
          (5120, 0, 1.25, 0, false, [('HDMI-0', '2560x1440@59.951', {})])], 
          {'layout-mode': <uint32 3>}, 
          [('DP-0', 'DEL', 'DELL G3223Q', '6BX70P3'), ('HDMI-0', 'DEL', 'DELL U2520D', 'H4MM923')]
        )]
      '';
    };
    "org/gnome/shell/extensions/mediacontrols" = {
      colored-player-icon = true;
      elements-order = [ "ICON" "CONTROLS" "LABEL" ];
      extension-position = "Left";
      label-width = "mkUint32 0";
      labels-order = [ "TITLE" "-" "ARTIST" ];
      scroll-labels = false;
      show-control-icons-seek-backward = false;
      show-control-icons-seek-forward = false;
    };
    "org/gnome/shell/extensions/user-theme-x" = {
      name = "Yaru-magenta";
      x-color = "prefer-light";
      x-color-night = "prefer-dark";
      x-cursor = "Yaru";
      x-cursor-night = "Yaru";
      x-gtk = "Yaru-magenta";
      x-gtk-night = "Yaru-magenta-dark";
      x-icons = "Yaru-magenta";
      x-icons-night = "Yaru-magenta-dark";
      x-shell = "Yaru-magenta";
      x-shell-night = "Yaru-magenta-dark";
      x-stylesheet = true;
    };
  };
}
