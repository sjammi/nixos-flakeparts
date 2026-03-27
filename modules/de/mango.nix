{ inputs, ... }:
{
  flake.nixosModules.mango =
    { ... }:
    {
      imports = [
        inputs.mangowm.nixosModules.mango
      ];

      programs.mangowc.enable = true;
      xdg.portal.wlr.enable = true;
    };
}
