{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    (inputs.import-tree ../../modules)
  ];

  my_awesome_module.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "23.11";
  swapDevices = [];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = false;
        device = "nodev"; # INFO: https://discourse.nixos.org/t/question-about-grub-and-nodev
      };
    };

    supportedFilesystems = ["nfs"];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/dd518f17-61c9-4831-b1bd-e1cc2af292aa";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/0A56-EBFE";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };

    "/var/media" = {
      device = "/dev/disk/by-label/data";
      fsType = "ext4";
    };
  };

  boot = {
    initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-intel"];
    kernelParams = [];
    extraModulePackages = [];
  };

  hardware.cpu.intel.updateMicrocode = true;
}
