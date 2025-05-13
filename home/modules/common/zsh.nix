{ config, pkgs, ... }:
let
  catppuccinTheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
    sha256 = "sha256-LQjHjJftaGvbKL+1SPLwnThHH2X6m1VUqj7GQXcBQfQ=";
  };
  p10kFile = ./config/.p10k.zsh;
in
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "history" ];
    };
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    dotDir = ".config/zsh";
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''
      if [ -f ${catppuccinTheme} ]; then
        source ${catppuccinTheme}
      fi

      if [ -f ${p10kFile} ]; then
        source ${p10kFile}
      fi
    '';
  };
}

