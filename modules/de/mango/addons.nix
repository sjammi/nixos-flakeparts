{ ... }:
{
  flake.nixosModules.mangoAddons =
    { pkgs, ... }:
    {
      programs.waybar.enable = true;

      programs.hyprlock.enable = true;
      services.hypridle.enable = true;

      services.blueman.enable = true;

      environment.systemPackages = with pkgs; [
        swaynotificationcenter
        libnotify

        swww
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
    };
}
