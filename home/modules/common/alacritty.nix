{ config, pkgs, ... }:
let
  themeFile = ./config/.alacritty_theme.toml;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "Cascadia Code";
    };
  };
}
