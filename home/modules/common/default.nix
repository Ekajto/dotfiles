{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
    ./kitty.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    cascadia-code
    jq
    ];
}
