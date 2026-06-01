{ config, pkgs, ... }:

{
  home.username = "ty3uk";
  home.homeDirectory = "/home/ty3uk";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    iosevka
  ];

  gtk = {
    enable = true;
    colorScheme = "dark";
  };

  programs.firefox.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.rofi = {
    enable = true;
    font = "Iosevka Regular 14";
    theme = "gruvbox-dark";
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka";
      size = 15;
    };
    themeFile = "gruvbox-dark";
    settings = {
      background = "#000000";
      background_opacity = 0.75;
    };
  };
}
