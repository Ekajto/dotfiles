{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    settings = {
      font.normal.family = "Cascadia Code";
    };
  };
}
