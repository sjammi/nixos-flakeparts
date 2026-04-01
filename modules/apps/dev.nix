{ ... }:
{
  flake.nixosModules.appsDev =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zed-editor
        ghostty
        just
        docker
        docker-compose
        gh
      ];
    };

}
