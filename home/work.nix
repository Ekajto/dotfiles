{
  lib, pkgs,
  ...
}: {
  imports = [
    ./modules/common
  ];
  home = {
    username = "kacperut";
    homeDirectory = "/home/kacperut";

    stateVersion = "24.11";
  };
}
