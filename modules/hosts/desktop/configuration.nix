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
        self.nixosModules.appsGeneral
        self.nixosModules.appsDev
        self.nixosModules.appsGaming
        self.nixosModules.deMango
      ];

      services.printing.enable = true;

      users.users.sushijam = {
        shell = pkgs.zsh;
        ignoreShellProgramCheck = true;
        isNormalUser = true;
        description = "";
        extraGroups = [
          "networkmanager"
          "wheel"
          "i2c"
          "audio"
          "video"
          "input"
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
        curl
        bat
        xclip
        ddcutil
        unzip
        ripgrep
        tealdeer
        chezmoi
      ];

      system.stateVersion = "25.11";
    };
}
