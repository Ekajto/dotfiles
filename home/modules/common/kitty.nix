
{ config, pkgs, lib, ... }:
let
  localApplications = ".local/share/applications";
  kittyPkg = config.lib.nixGL.wrap pkgs.kitty;
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

  # Copy .desktop files from the Nix store to the applications directory
  home.file."${localApplications}/kitty.desktop".source = "${kittyPkg}/share/applications/kitty.desktop";
  home.file."${localApplications}/kitty-open.desktop".source = "${kittyPkg}/share/applications/kitty-open.desktop";
  home.file.".local/bin/kitty".source = "${kittyPkg}/bin/kitty";
  home.file.".local/bin/kitten".source = "${kittyPkg}/bin/kitten";
  # Patch the .desktop files after they're created, using the variable
  home.activation.fixKittyDesktop = lib.hm.dag.entryAfter ["linkGeneration"] ''
    sed -i "s|Exec=kitty|Exec=${kittyPkg}/bin/kitty|g" ${localApplications}/kitty*.desktop
    sed -i "s|Icon=kitty|Icon=${kittyPkg}/share/icons/hicolor/256x256/apps/kitty.png|g" ${localApplications}/kitty*.desktop
  '';
}
