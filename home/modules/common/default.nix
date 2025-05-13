{pkgs, nixgl, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./kitty.nix
    ./tmux.nix
    ./nvim.nix
    ./k9s.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    nerd-fonts.caskaydia-cove
    jq
    kubectl
    kubectx
    ];
}
