{ config, lib, pkgs, modulesPath, inputs, outputs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yiraa = {
    hashedPassword = "$y$j9T$VEgANOMZmhzR5swSwXJs10$bREoO3uw2gg6d29LxyYmTqYMHGm2CEbzd7QFHSFnK02";
    isNormalUser = true;
    description = "Yiraa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
      kdePackages.kate
    ];
  };

  users.mutableUsers = false;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      yiraa = import ../home-manager/home.nix;
    };
  };

  users.defaultUserShell = pkgs.zsh;

}
