{ self, ... }:
{
  flake.nixosModules.desktopSystemConfig =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.nix
        self.nixosModules.customHardware
      ];

      fileSystems."/data" = {
        device = "/dev/disk/by-uuid/46141067-23d3-45ac-a6cf-fea45eeb27e7";
        fsType = "btrfs";
      };

      boot.loader.systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      boot.loader.efi.canTouchEfiVariables = true;

      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "nixos";
      networking.wireless.enable = true;
      networking.networkmanager.enable = true;

      time.timeZone = "America/New_York";
      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };

      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;

      services.xserver = {
        enable = true;
        autoRepeatDelay = 200;
        autoRepeatInterval = 35;
        xkb = {
          layout = "us";
          variant = "";
        };
      };

      services.printing.enable = true;
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };

      hardware = {
        enableAllFirmware = true;
        i2c.enable = true;
        bluetooth = {
          enable = true;
          settings = {
            General = {
              Enable = "Source,Sink,Media,Socket";
            };
          };
        };
      };
    };
}
