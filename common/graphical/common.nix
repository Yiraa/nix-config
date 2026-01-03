{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    ./firefox.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    jetbrains.rust-rover
    zed-editor
    spotify
    alacritty
    parsec-bin
    zsa-udev-rules
    keymapp
    blender
    gimp
  ];

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
    services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing.drivers = [
    pkgs.gutenprint
    pkgs.gutenprintBin
    pkgs.utsushi
    pkgs.epson-escpr
    pkgs.epson-escpr2
  ];

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "yiraa";
}
