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

      users.users.sushijam.packages = (
        with pkgs;
        [
          gearlever
          keepassxc
          btop
          duf
          fsarchiver
          glances
          cliphist
          neovim
          ranger
          yazi
          wiremix
          brave
          filen-desktop
          gimp
          libreoffice-still
          proton-vpn-cli
          fzf
        ]
      );
    };
}
