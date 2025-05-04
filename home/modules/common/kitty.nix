
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "Cascadia Code"; 
    };
  };
}
