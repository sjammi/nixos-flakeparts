{
  self,
  inputs,
  config,
  ...
}:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfiguration

      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.backupFileExtension = "bak";
        home-manager.users.sushijam = {
          imports = [
            config.flake.homeModules.sushijam
          ];
        };
      }

    ];
  };
}
