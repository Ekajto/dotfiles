{ config, pkgs, ... }:
let
  themeFile = ./config/.alacritty_theme.toml;
in
{
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    settings = {
      font.normal.family = "Cascadia Code";
    };
  };
}
