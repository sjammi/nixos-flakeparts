{ ... }:
{
  flake.nixosModules.appsDev =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zed-editor
        ghostty
        just
        gh

        docker
        docker-compose
        podman-tui
      ];

      virtualisation.containers.enable = true;
      virtualisation = {
        podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
      };
    };
}
