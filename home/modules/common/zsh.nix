{ config, pkgs, ... }:
let
  catppuccinTheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
    sha256 = "sha256-1x2105vl3iiym9a5b6zsclglff4xy3r4iddz53dnns7djy6cf21d";
  };
in
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history" "zsh-syntax-highlighting" ];
    };
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    initExtra = ''
      if [ -f ${catppuccinTheme} ]; then
        source ${catppuccinTheme}
      fi
    '';
  };
  home.file.".zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh".source = catppuccinTheme;
}

