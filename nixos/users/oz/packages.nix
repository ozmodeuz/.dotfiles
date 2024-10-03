{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    _1password
    chromium
    eyedropper
    firefox
    git
    gnome-extension-manager
    kitty
    micro
    nixfmt-rfc-style
    nuclear
    scribus
    thunderbird
    vscodium
    # fonts
    ( nerdfonts.override {
      fonts = [
        "0xProto"
        ];
      })
    # gnome extensions
    gnomeExtensions.appindicator
    gnomeExtensions.arcmenu
    gnomeExtensions.dash-to-panel
    gnomeExtensions.gsconnect
    gnomeExtensions.media-controls
    gnomeExtensions.tailscale-qs
    gnomeExtensions.user-themes-x
    # themes
    yaru-theme
  ];
}