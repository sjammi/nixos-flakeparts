{ ... }:
{
  flake.nixosModules.appsDev =
    { pkgs, ... }:
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ls = "ls -la";
          nrs = "sudo nixos-rebuild switch";
        };

        histSize = 10000;
        histFile = "$HOME/.zsh_history";
        setOptions = [
          "HIST_IGNORE_ALL_DUPS"
        ];

        ohMyZsh = {
          enable = true;
          plugins = [
            "git"
            "docker"
            "sudo"
            "starship"
          ];
        };
      };
      programs.starship.enable = true;

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
