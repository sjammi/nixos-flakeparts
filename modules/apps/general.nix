{ inputs, ... }:
{
  flake.nixosModules.appsGeneral =
    { pkgs, ... }:
    {
      imports = [
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];

      programs.appimage.enable = true;
      programs.appimage.binfmt = true;

      services.flatpak = {
        enable = true;
      };

      services.tailscale.enable = true;

      users.users.sushijam.packages = (
        with pkgs;
        [
          gearlever
          duf
          fsarchiver
          glances
          cliphist
          proton-vpn-cli
          fzf
          libreoffice-still
        ]
      );
    };
}
