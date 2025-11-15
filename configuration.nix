{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # NixOS Version:
  system.stateVersion = "25.05";

  # Enable flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable unfree packages:
  nixpkgs.config.allowUnfree = true;

  # Bootloader:
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking:
  networking.hostName = "thenous";
  networking.networkmanager.enable = true;

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

  # Users:
  users.users.cka = {
    isNormalUser = true;
    description = "CKA";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Program configuration:
  programs.git.enable = true;

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;

  # Pkgs:
  environment.systemPackages = with pkgs; [ ];
}
