{ config, pkgs, unstablePkgs, ... }:

{
  home.packages = 
    (with pkgs; [
      alacritty
      chromium
      eyedropper
      firefox
      git
      kitty
      micro
      nixfmt-rfc-style
      nuclear
      scribus
      thunderbird
      vscodium
      ( nerdfonts.override {
        fonts = [
          "0xProto"
        ];
      })
    ])

    ++

    (with unstablePkgs; [
      _1password
      _1password-gui
    ]);

}