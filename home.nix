{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Dev/Personal/dotfiles";
in
{
  home.username = "ty3uk";
  home.homeDirectory = "/home/ty3uk";
  home.stateVersion = "26.05";
  home.packages = with pkgs; [
    tmux
    rofi
    starship
    fnm
    yazi
    iosevka-bin
    lazygit
  ];
  home.sessionVariables = {
    EDITOR = "hx";
  };

  xdg.configFile = {
    fish.source            = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/fish/.config/fish";
    hypr.source            = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hyprland/.config/hypr";
    kitty.source           = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/kitty/.config/kitty";
    yazi.source            = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/yazi/.config/yazi";
    tmux.source            = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux/.config/tmux";
    helix.source           = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/helix/.config/helix";
    lazygit.source         = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/lazygit/.config/lazygit";
    "starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/starship/.config/starship.toml";
  };
  programs.git = {
    enable = true;
    userName = "Maksim Karelov";
    userEmail = "max.karelov@gmail.com";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
  };

  programs.home-manager.enable = true;
}
