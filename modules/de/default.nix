{ self, ... }:
{
  flake.nixosModules.desktopEnvironment =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.nix
        self.nixosModules.customHardware
      ];

      # Enable the GNOME Desktop Environment.
      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;

      services.displayManager.autoLogin = {
        enable = true;
        user = "sushijam";
      };
    };
}
