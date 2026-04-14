{ ... }:
{
  flake.nixosModules.mangoAddons =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        swaynotificationcenter
        libnotify

        awww
        matugen
        rofi

        hyprlock
        hypridle

        waybar
        gpu-usage-waybar

        blueman
        imagemagick

        kora-icon-theme
      ];

      programs.waybar.enable = true;

      programs.hyprlock.enable = true;
      services.hypridle.enable = true;

      services.blueman.enable = true;
    };
}
