{ self, inputs, ... }:
{
  flake.nixosModules.deMangoDMS =
    { ... }:
    {
      imports = [
        inputs.dms.nixosModules.dank-material-shell
      ];

      programs.dank-material-shell = {
        enable = true;

        systemd = {
          enable = true; # Systemd service for auto-start
          restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
        };

        # Core features
        enableSystemMonitoring = true; # System monitoring widgets (dgop)
        enableVPN = true; # VPN management widget
        enableDynamicTheming = true; # Wallpaper-based theming (matugen)
        enableClipboardPaste = true; # Pasting items from the clipboard (wtype)
      };
    };
}
