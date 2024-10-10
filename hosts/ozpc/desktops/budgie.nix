{ lib, pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.budgie.enable = true;
}