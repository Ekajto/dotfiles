{
  lib, pkgs,
  ...
}: {
  imports = [
    ./modules/common.nix
  ];
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "ekajto";
    homeDirectory = "/home/ekajto";

    stateVersion = "24.11";
  };
}
