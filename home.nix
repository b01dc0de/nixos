{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/home/cka";

  # Home pkgs:
  home.packages = with pkgs; [ ];

  # Wallpaper:
  home.file."wallpaper.jpg".source = pkgs.fetchurl {
    url = "https://unsplash.com/photos/EnEvA02Oz4M/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjR8fGJydXRhbGlzdCUyMGFyY2hpdGVjdHVyZXxlbnwwfHx8fDE3NjMxNzM4OTZ8MA&force=true";
    hash = "sha256-ISC0tlBpQ1GDLSFTzKGEI07wOmPUZmfy9uWGAvrLvb8=";
  };

  # Hyprland:
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = null;
  wayland.windowManager.hyprland.portalPackage = null;
  wayland.windowManager.hyprland.extraConfig = lib.fileContents ./cfg/hypr/hyprland.conf;

  # Kitty:
  programs.kitty.enable = true;
  programs.kitty.font.name = "JetBrainsMono Nerd Font";
  programs.kitty.font.size = 12;
  programs.kitty.settings.enable_audio_bell = false;
  programs.kitty.themeFile = "Catppuccin-Mocha";
  programs.kitty.extraConfig = lib.fileContents ./cfg/kitty/kitty.conf;
}
