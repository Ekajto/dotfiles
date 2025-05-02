{
  lib, pkgs,
  ...
}: {
  imports = [
    ./global
  ];
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "kacperut";
    homeDirectory = "/home/kacperut";

    stateVersion = "24.11";
  };
}
