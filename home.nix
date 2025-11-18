{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/home/cka";

  # Wallpaper:
  home.file."wallpaper.jpg".source = pkgs.fetchurl {
    url = "https://unsplash.com/photos/EnEvA02Oz4M/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjR8fGJydXRhbGlzdCUyMGFyY2hpdGVjdHVyZXxlbnwwfHx8fDE3NjMxNzM4OTZ8MA&force=true";
    hash = "sha256-ISC0tlBpQ1GDLSFTzKGEI07wOmPUZmfy9uWGAvrLvb8=";
  };

  # Home pkgs:
  home.packages = with pkgs; [ ];

  # Hyprland:
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = null;
  wayland.windowManager.hyprland.portalPackage = null;
  wayland.windowManager.hyprland.extraConfig = lib.fileContents ./cfg/hypr/hyprland.conf;

  ##########################
  # Program configuration: #
  ##########################

  # Bash:
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.initExtra = ''fastfetch'';
  programs.bash.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l --color=auto";
    la = "ls -la --color=auto";
  };

  # Kitty:
  programs.kitty.enable = true;
  programs.kitty.enableGitIntegration = true;
  programs.kitty.font.name = "JetBrainsMono Nerd Font";
  programs.kitty.font.size = 12;
  programs.kitty.settings = {
    enable_audio_bell = false;
    confirm_os_window_close = 0;
  };
  programs.kitty.shellIntegration.enableBashIntegration = true;
  programs.kitty.themeFile = "Catppuccin-Mocha";

  # Oh My Posh:
  programs.oh-my-posh.enable = true;
  programs.oh-my-posh.enableBashIntegration = true;
  programs.oh-my-posh.useTheme = "nordtron";
}
