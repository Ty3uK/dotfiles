# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.limine = {
    enable = true;
    secureBoot.enable = true;
    extraEntries = ''
      /CachyOS
        protocol: efi
        path: boot():/EFI/Linux/arch-linux-cachyos.efi
    '';
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";

  users.users.ty3uk = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  services.udisks2.enable = true;
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.fish.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    sbctl
    wget
    git
    helix
    kitty
    wl-clipboard
    wtype
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "26.05";
}
