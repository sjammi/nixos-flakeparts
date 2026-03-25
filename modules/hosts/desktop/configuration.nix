{ self, ... }:
{
  flake.nixosModules.desktopConfiguration =
    {
      pkgs,
      ...
    }:
    {
      imports = [
        self.nixosModules.desktopHardware
        self.nixosModules.desktopSystemConfig
        self.nixosModules.generalApps
        self.nixosModules.dev
        self.nixosModules.gaming
      ];

      services.printing.enable = true;

      users.users.sushijam = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "";
        extraGroups = [
          "networkmanager"
          "wheel"
          "i2c"
        ];
        packages = with pkgs; [
          tree
        ];
      };
      programs.firefox.enable = true;

      environment.systemPackages = with pkgs; [
        vim
        wget
        git
        bat
        xclip
        ddcutil
        unzip
        ripgrep
        tealdeer
      ];

      system.stateVersion = "25.11";
    };
}
