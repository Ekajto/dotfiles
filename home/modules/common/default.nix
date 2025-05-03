{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./zsh.nix
  ];
   home.packages = with pkgs; [
    jq
    ];
}
