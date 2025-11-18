{ config, pkgs, lib, ... }:

{
  # NixOS Version:
  system.stateVersion = "25.11";

  # Enable flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable unfree packages:
  nixpkgs.config.allowUnfree = true;

  # Bootloader:
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.configurationLimit = 16;
  boot.loader.grub.default = "saved";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.theme = "${pkgs.minimal-grub-theme}";

  # Networking:
  networking.hostName = lib.mkDefault "unnamed";
  networking.networkmanager.enable = true;

  # Bluetooth:
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Timezone / Locale: 
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Keymap:
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Fonts:
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      oxygenfonts
      nerd-fonts.blex-mono
      nerd-fonts.fira-code
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.sauce-code-pro
      nerd-fonts.symbols-only
      nerd-fonts.terminess-ttf
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
      nerd-fonts.ubuntu-sans
    ];
  };

  # Sound:
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Users:
  users.users.cka = {
    isNormalUser = true;
    description = "CKA";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Environment:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.variables.EDITOR = "nvim";

  # GPU:
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Default session:
  services.displayManager.defaultSession = "hyprland-uwsm";

  # Hyprland:
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.extraPackages = with pkgs; [
    where-is-my-sddm-theme
    kdePackages.qt5compat
  ];
  services.displayManager.sddm.theme = "${pkgs.where-is-my-sddm-theme}/share/sddm/themes/where_is_my_sddm_theme";
  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
  programs.hyprland.xwayland.enable = true;
  programs.uwsm.enable = true;
  programs.uwsm.waylandCompositors = {
    hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };
  # Enable GNOME keyring within hyprland (needed for GitHub Desktop):
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.hyprland.enableGnomeKeyring = true;

  ##########################
  # Program configuration: #
  ##########################

  programs.chromium.enable = true;
  programs.chromium.extensions = [
    "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
    "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock Origin Lite
    "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
  ];

  programs.git.enable = true;

  programs.nh.enable = true;
  programs.nh.clean.enable = true;

  # Pkgs:
  environment.systemPackages = with pkgs; [
    chromium
    efibootmgr
    fastfetch
    github-desktop
    hyprpaper
    hyprpicker
    kdePackages.dolphin
    kitty
    neovide
    nordic
    nwg-look
    obsidian
    playerctl
    spotify
    vscode-fhs
    waybar
    wofi
  ];
}
