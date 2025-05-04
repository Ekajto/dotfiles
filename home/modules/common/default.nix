{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./alacritty.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    cascadia-code
    jq
    ];
}
