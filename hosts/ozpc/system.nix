{ config, pkgs, ... }:

{
  # boot loader
  boot = {
    loader.grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
    };
    plymouth.enable = true;
    plymouth.theme = "breeze";
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };

  # networking
  networking.hostName = "ozpc";
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
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.xkb = {
    layout = "gb";
    variant = "extd";
  };
  # services.xserver.libinput.enable = true;

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
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6iKmnjRIMjVGYgN5SG8gVIqGT8r6DXpszo8P1FZk6j"
      ];
    };
  };

  # environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # packages
  environment.systemPackages = with pkgs; [
    btop
    cloudflared
    curl
    flatpak
    git
    home-manager
    jdk
    jdk17
    nvd
    plymouth
    tailscale
    vim
    wget
  ];

  # tailscale
  services.tailscale = {
    enable = true;
    extraUpFlags = "--operator=oz";
  };

  # other services
  services.flatpak.enable = true;
  services.openssh.enable = true;
  services.printing.enable = true;
  services.qemuGuest.enable = true;

  # misc bits
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;
  system.stateVersion = "24.05"; # Don't change :)
  
  /*system.updateCheck = {
    enable = true;
    flake = "/home/oz/.dotfiles/.";
  };*/

}
