{
  lib, pkgs,
  ...
}: {
  imports = [
    ./modules/common
  ];
  home = {
    username = "ekajto";
    homeDirectory = "/home/ekajto";

    stateVersion = "24.11";
  };
}
