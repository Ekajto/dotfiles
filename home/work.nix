{
  lib, pkgs, nixgl,
  ...
}: {
  imports = [
    ./modules/common
  ];
  home = {
    username = "kacperut";
    homeDirectory = "/home/kacperut";
    shell.enableZshIntegration = true;
    shell.enableShellIntegration = false;
    stateVersion = "24.11";
  };
  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.offloadWrapper = "nvidiaPrime";
  nixGL.installScripts = [ "mesa" "nvidiaPrime" ];
}
