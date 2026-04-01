{
  ...
}:
let
  dataDir = "/data/sushijam";
in
{
  flake.homeModules.sushijam =
    { config, pkgs, ... }:
    {
      programs.home-manager.enable = true;

      home = {
        username = "sushijam";
        homeDirectory = "/home/sushijam";
        sessionPath = [ "$HOME/.local/bin" ];
        stateVersion = "25.11";
        file = {
          Applications.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Applications";
          Desktop.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Desktop";
          Documents.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Documents";
          Downloads.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Downloads";
          Faugus.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Faugus";
          Games.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Games";
          Music.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Music";
          Pictures.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Pictures";
          Templates.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Templates";
          Videos.source = config.lib.file.mkOutOfStoreSymlink dataDir + "/Videos";
          "db.kdbx".source = config.lib.file.mkOutOfStoreSymlink dataDir + "/db.kdbx";
        };
      };

      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ls = "ls -la";
          nrs = "sudo nixos-rebuild switch --flake /home/sushijam/nixos#desktop";
        };

        history = {
          path = "$HOME/.zsh_history";
          saveNoDups = true;
          size = 10000;
        };

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "docker"
            "sudo"
          ];
        };
      };
      programs.oh-my-posh = {
        enable = true;
        configFile = "$HOME/.config/ohmyposh/custom_config.json";
        enableZshIntegration = true;
      };
      programs.fzf.enable = true;

      home.packages = with pkgs; [
        pyenv
        nautilus
      ];
    };
}
