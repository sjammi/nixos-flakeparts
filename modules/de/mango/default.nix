{ self, ... }:
{
  flake.nixosModules.deMango =
    { ... }:
    {
      imports = [
        self.nixosModules.mangoConfig
        self.nixosModules.mangoFonts
        self.nixosModules.mangoAddons

        # self.nixosModules.deMangoDMS
      ];

      services.displayManager.autoLogin = {
        enable = true;
        user = "sushijam";
      };
    };
}
