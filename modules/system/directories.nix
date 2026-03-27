{ ... }:
{
  flake.nixosModules.directories =
    {
      config,
      ...
    }:
    {
      ## Not in use, home-manager is running in background handling some of the symlinks. To fix later.
    };
}
