{ self, ... }:
{
  flake.nixosModules.desktopEnvironment =
    { ... }:
    {
      imports = [
        self.nixosModules.mango
        self.nixosModules.deFonts
        self.nixosModules.deUtils
      ];

      # services.xserver.displayManager.gdm.enable = true;
      # services.xserver.desktopManager.gnome.enable = true;

      services.displayManager.autoLogin = {
        enable = true;
        user = "sushijam";
      };
    };
}
