{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/home/cka";

  # Home pkgs:
  home.packages = with pkgs; [ ];

  # Hyprland:
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = null;
  wayland.windowManager.hyprland.portalPackage = null;
  wayland.windowManager.hyprland.extraConfig = lib.fileContents ./cfg/hypr/hyprland.conf;
}
