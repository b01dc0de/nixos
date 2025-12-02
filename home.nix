{ config, pkgs, lib, ... }:

{
    programs.home-manager.enable = true;
    home.username = "cka";
    home.homeDirectory = "/home/cka";

    # Wallpaper:
    home.file."wallpaper.jpg".source = pkgs.fetchurl {
        url = "https://unsplash.com/photos/EnEvA02Oz4M/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjR8fGJydXRhbGlzdCUyMGFyY2hpdGVjdHVyZXxlbnwwfHx8fDE3NjMxNzM4OTZ8MA&force=true";
        hash = "sha256-ISC0tlBpQ1GDLSFTzKGEI07wOmPUZmfy9uWGAvrLvb8=";
    };

    # .Xresources:
    xresources.properties = {
        "Xft.dpi" = 144;
    };

    # Home pkgs:
    home.packages = with pkgs; [ ];

    # Theming:
    home.pointerCursor.gtk.enable = true;
    home.pointerCursor.package = pkgs.nordic;
    home.pointerCursor.name = "Nordic-cursors";
    home.pointerCursor.size = 24;
    gtk.enable = true;
    gtk.theme.package = pkgs.nordic;
    gtk.theme.name = "Nordic";
    gtk.iconTheme.package = pkgs.nordic;
    gtk.iconTheme.name = "Nordic-bluish";

    # Hyprland:
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.package = null;
    wayland.windowManager.hyprland.portalPackage = null;
    wayland.windowManager.hyprland.extraConfig = lib.fileContents ./cfg/hypr/hyprland.conf;
    # Hyprland ecosystem:
    programs.hyprpanel.enable = true;
    home.file.".config/hypr/hyprtoolkit.conf".source = ./cfg/hypr/hyprtoolkit.conf;

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
        la = "ls -lA --color=auto";
    };

    # Direnv:
    programs.direnv.enable = true;
    programs.direnv.enableBashIntegration = true;
    programs.direnv.nix-direnv.enable = true;

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

    # Neovim:
    programs.neovim.enable = true;
    programs.neovim.extraConfig = lib.fileContents ./cfg/nvim/init.vim;
    programs.neovim.plugins = with pkgs.vimPlugins; [
        nord-nvim
    ];
    programs.neovim.viAlias = true;
    programs.neovim.vimAlias = true;
    programs.neovim.vimdiffAlias = true;

    # Oh My Posh:
    programs.oh-my-posh.enable = true;
    programs.oh-my-posh.enableBashIntegration = true;
    programs.oh-my-posh.useTheme = "nordtron";

    # State Version:
    # DO NOT CHANGE! See comment above system.stateVersion in ./configuration.nix
    home.stateVersion = "25.11";
}
