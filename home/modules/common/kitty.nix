
{ config, pkgs, lib, ... }:
let
  localApplications = ".local/share/applications";
  kittyPkg = config.lib.nixGL.wrap pkgs.kitty;
  patchedDesktop = name: pkgs.runCommand "kitty-${name}.desktop" {} ''
    sed \
      -e "s|Exec=kitty|Exec=${kittyPkg}/bin/kitty|g" \
      -e "s|Icon=kitty|Icon=${kittyPkg}/share/icons/hicolor/256x256/apps/kitty.png|g" \
      "${kittyPkg}/share/applications/${name}.desktop" > $out
  '';
in
{
  programs.kitty = {
    enable = true;
    package = kittyPkg;
    themeFile = "Catppuccin-Mocha";
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 14;
    };
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

  #xdg.dataFile = {
  #  "applications/kitty.desktop".source = patchedDesktop "kitty";
  #  "applications/kitty-open.desktop".source = patchedDesktop "kitty-open";
  #};
    xdg.dataFile = {
    "applications/kitty.desktop".source = "${kittyPkg}/share/applications/kitty.desktop";
    "applications/kitty-open.desktop".source = "${kittyPkg}/share/applications/kitty-open.desktop";
  };
}
