{
  lib, pkgs,
  ...
}: {
  imports = [
    ./modules/common.nix
  ];
  home = {
    username = "ekajto";
    homeDirectory = "/home/ekajto";

    stateVersion = "24.11";
  };
}
