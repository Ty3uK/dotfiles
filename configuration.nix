{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      efiSupport = true;
      secureBoot.enable = true;
      extraConfig = ''
        /CachyOS
        protocol: efi
        path: boot():/EFI/Linux/arch-linux-cachyos.efi
      '';
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.ty3uk = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    sbctl
    neovim
    git
    wget
    fish
  ];

  programs.fish.enable = true;
  programs.mango.enable = true;
  programs.dconf.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "26.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
