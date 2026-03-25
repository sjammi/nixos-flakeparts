{ inputs, ... }:
{
  flake.nixosModules.gaming =
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

      programs.gamemode.enable = true;
    };
}
