{ config, pkgs, ... }:
let
  catppuccinTheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
  };
in
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history" "zsh-syntax-highlighting" ];
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    initExtra = ''
      if [ -f ${catppuccinTheme} ]; then
        source ${catppuccinTheme}
      fi
    '';
  };
  home.file.".zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh".source = catppuccinTheme;
}

