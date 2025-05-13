{
  lib, pkgs, nixgl,
  ...
}: {
  imports = [
    ./modules/common
  ];
  home = {
    username = "ekajto";
    homeDirectory = "/home/ekajto";
    shell.enableZshIntegration = true;
    shell.enableShellIntegration = false;
    stateVersion = "24.11";
  };
  nixGL.packages = nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.offloadWrapper = "nvidiaPrime";
  nixGL.installScripts = [ "mesa" "nvidiaPrime" ];
}
