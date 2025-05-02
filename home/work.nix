{
  lib, pkgs,
  ...
}: {
  imports = [
    ./modules/common.nix
  ];
  home = {
    username = "kacperut";
    homeDirectory = "/home/kacperut";

    stateVersion = "24.11";
  };
}
