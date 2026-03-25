{ ... }:
{
  flake.nixosModules.dev =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
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
