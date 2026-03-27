{ self, ... }:
{
  flake.nixosModules.deFonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        nerd-fonts.lilex
        nerd-fonts.space-mono
      ];
    };
}
