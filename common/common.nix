{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  imports = [
    ./lang.nix
    ./user.nix
    ./tmux.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  environment.systemPackages = with pkgs; [
    zsh
    vim
    wget
    git
    gh
    usbutils
    nil
    ripgrep
    fzf
    tmux-sessionizer
  ];

  #programs.starship = {
  #  enable = true;
  #  settings = {
  #    add_newline = false;
  #  };
  #};

  # Enable networking
  networking.networkmanager.enable = true;

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = false;
    };
  };

  programs.zsh = {
    enable = true;
    interactiveShellInit = ''
      [ -z "$TMUX" ] && exec tmux
    '';
    ohMyZsh = {
      enable = true;
      theme = "cypher";
    };
  };
}
