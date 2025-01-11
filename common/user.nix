{ config, lib, pkgs, modulesPath, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yiraa = {
    initialPassword = "test";
    isNormalUser = true;
    description = "Yiraa";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      inputs.home-manager.packages.${pkgs.system}.default
      kdePackages.kate
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      yiraa = import ../home-manager/home.nix;
    };
  };
}
