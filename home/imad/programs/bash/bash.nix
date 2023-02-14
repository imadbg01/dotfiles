{pkgs, lib, ...}:

{

  programs.bash = {
    enable = true;
    bashrcExtra = lib.fileContents ./config/bashrc;
  };
}
