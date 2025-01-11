{
  inputs,
  lib,
  config,
  pkgs,
  outputs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.default

    ../../common/common.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "yiraa";
  wsl.interop.includePath = false;

  networking.hostName = "nixos-wsl";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "24.05"; # Did you read the comment?
}
