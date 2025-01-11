{ config, lib, pkgs, modulesPath, ... }:
{
  fonts.packages = with pkgs; [
    nerdfonts
    libertine
    noto-fonts
  ];

  fonts.fontconfig.defaultFonts = {
    serif = [  "Linux Libertine Display O" ];
    sansSerif = [ "Noto Sans" ];
    monospace = [ "FiraCode Nerd Font" ];
  };
}
