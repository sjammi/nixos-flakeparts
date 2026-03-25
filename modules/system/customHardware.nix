{ ... }:
{
  flake.nixosModules.customHardware =
    {
      config,
      lib,
      ...
    }:
    {
      ### CPU
      boot.blacklistedKernelModules =
        (lib.optionals (!config.hardware.enableRedistributableFirmware) [
          "ath3k"
        ])
        ++ [ "k10temp" ];

      boot.extraModulePackages = [
        config.boot.kernelPackages.zenpower
      ]
      ### Motherboard
      ++ (with config.boot.kernelPackages; [
        nct6687d
      ]);

      boot.kernelModules = [
        "kvm-amd"
        "nct6687d"
        "amd_pstate=active"
      ];

      ### SSD
      services.fstrim.enable = lib.mkDefault true;

      ### GPU
      services.xserver.videoDrivers = lib.mkDefault [ "modesetting" ];

      hardware.graphics = {
        enable = lib.mkDefault true;
        enable32Bit = lib.mkDefault true;
      };

      hardware.amdgpu.initrd.enable = lib.mkDefault true;
    };
}
