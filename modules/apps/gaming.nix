{ ... }:
{
  flake.nixosModules.appsGaming =
    { pkgs, ... }:
    {
      users.users.sushijam.packages = (
        with pkgs;
        [
          discord
          lutris
          goverlay
          protonup-qt
          wine
          faugus-launcher
        ]
      );

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        gamescopeSession.enable = true;
      };

      hardware.xone.enable = true;
      programs.gamemode.enable = true;
    };
}
