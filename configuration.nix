# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`)
{ config, lib, pkgs, ... }:

{
  # Other config files import
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  # Printing
  services.printing.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # User
  users.users.eakh = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  # Time zone and languages
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;

  # Packages list
  environment.systemPackages = with pkgs; [
    home-manager

    btop
    fastfetch
    yazi
    kitty
    rofi-wayland
    waybar

    neovim
    fzf
    ripgrep
    fd
    zig

    wireplumber
    pwvucontrol
    brightnessctl

    hyprcursor
    hyprlock
    hyprpaper

    prismlauncher
    firefox
    legcord
    git
  ];

  # Fonts list
  fonts.packages = with pkgs; [
    nerdfonts
  ];

  # First system version (do not touch)
  system.stateVersion = "24.11";

}

