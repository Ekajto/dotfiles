
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "Cascadia Code";
      size = 14;
    };
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
    extraConfig = ''
      startup_session launch sh -c "tmux -T hyperlinks new -A -s 0"
    '';
  };
}
