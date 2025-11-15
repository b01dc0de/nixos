{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
  home.username = "cka";
  home.homeDirectory = "/home/cka";

  # Home pkgs:
  home.packages = with pkgs; [ ];
}
