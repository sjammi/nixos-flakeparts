{ self, ... }:
{
  flake.nixosModules.deUtils =
    { pkgs, ... }:
    {
      programs.waybar.enable = true;

      programs.hyprlock.enable = true;
      services.hypridle.enable = true;

      services.blueman.enable = true;
      security.polkit.enable = true;

      environment.systemPackages = with pkgs; [
        swaynotificationcenter
        swww
        matugen
        rofi

        hyprlock
        hypridle

        waybar
        gpu-usage-waybar

        blueman
      ];
    };
}
