{ config, pkgs, ... }:

{
  # boot loader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # networking
  networking.hostName = "ozvm";
  networking.networkmanager.enable = true;

  # locale and time
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  console.keyMap = "uk";

  # window managers

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "gb";
    variant = "extd";
  };
  # services.xserver.libinput.enable = true;

  # display managers

  services.xserver.displayManager.gdm.enable = true;

  # desktop environments

  services.xserver.desktopManager.gnome.enable = true;

  # audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # users

  users = {
    users.oz = {
      isNormalUser = true;
      description = "Oz Browning";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # packages

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    btop
    cloudflared
    curl
    git
    jdk
    vim
    wget
  ];

  # services

  services.printing.enable = true;
  services.openssh.enable = true;

  # misc bits

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;
  system.stateVersion = "24.05"; # Don't change :)

}