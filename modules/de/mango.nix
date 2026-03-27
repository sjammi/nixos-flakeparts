{ self, inputs, ... }:
{
  flake.nixosModules.mango =
    { pkgs, ... }:
    {
      imports = [
        inputs.mangowm.nixosModules.mango
      ];

      programs.mangowc.enable = true;

      xdg.portal.wlr.enable = true;

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
