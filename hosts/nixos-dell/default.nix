# # This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
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
    inputs.hardware.nixosModules.dell-xps-13-7390

    ./hardware-configuration.nix
    ../../common/common.nix
    ../../common/graphical/common.nix

    ../../modules/steam.nix
  ];

  networking.hostName = "nixos-dell";

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
      extraEntries = { "w11.conf" = ''
        title Windows
        efi /EFI/Microsoft/Boot/bootmgfw.efi
        sort-key a_windows
      ''; };
      extraInstallCommands = ''
        echo "timeout 5" > /boot/loader/loader.conf
        echo "default w11.conf" >> /boot/loader/loader.conf
        echo "console-mode keep" >> /boot/loader/loader.conf
      '';
    };
    #timeout = 0;
  };

  boot = {
    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "mem_sleep_default=s2idle"
    ];
  };

  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  system.stateVersion = "24.11";
}
