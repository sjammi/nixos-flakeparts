{ inputs, ... }:
{
  flake.nixosModules.mangoConfig =
    { pkgs, ... }:
    {
      imports = [
        inputs.mangowm.nixosModules.mango
      ];

      programs.mangowc.enable = true;
      services.dbus.enable = true;
      security.polkit.enable = true;
      xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };

    };
}
