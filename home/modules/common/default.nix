{pkgs, ...}: {
  imports = [
    ./direnv.nix
  ];
   home.packages = with pkgs; [
    jq
    ];
}
