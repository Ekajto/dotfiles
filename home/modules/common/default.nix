{pkgs, nixgl, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./kitty.nix
    ./tmux.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    cascadia-code
    jq
    ];
}
