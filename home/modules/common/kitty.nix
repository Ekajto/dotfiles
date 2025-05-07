
{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 14;
    };
    shellIntegration.enableZshIntegration = true;
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
    extraConfig = ''
      startup_session launch.conf
    '';
  };
  home.file.".config/kitty/launch.conf".text = ''
  launch sh -c "tmux -T hyperlinks new -A -s 0"
'';
}
