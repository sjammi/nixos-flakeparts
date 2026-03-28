{ ... }:
{
  flake.nixosModules.deGnome =
    { ... }:
    {
      # imports = [];

      services.xserver.displayManager.gdm.enable = true;
      services.xserver.desktopManager.gnome.enable = true;

      services.displayManager.autoLogin = {
        enable = true;
        user = "sushijam";
      };
    };
}
