{pkgs, nixgl, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./kitty.nix
    ./tmux.nix
    ./nvim.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    jq
    ];
}
