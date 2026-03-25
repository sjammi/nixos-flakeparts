{
  self,
  inputs,
  config,
  ...
}:
{
  # flake.nixosModules.homeManager = {
  #   imports = [
  #     inputs.home-manager.flakeModules.home-manager
  #   ];
  #   home.stateVersion = "25.11";
  # };
  # flake.homeConfigurations.sushijam =
  #   { pkgs, ... }:
  #   {
  #     imports = [
  #       inputs.home-manager.flakeModules.home-manager
  #     ];
  #     home.stateVersion = "25.11";

  # services = {
  #   home-manager.autoExpire = {
  #     enable = true;
  #     frequency = "weekly";
  #     store.cleanup = true;
  #   };
  # };
}
