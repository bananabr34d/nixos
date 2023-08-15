{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
#    syntaxHighlighting.enable= true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker-compose" "docker" ];
      theme = "amuse";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
      eval "$(${cfg.package}/bin/zoxide init zsh ${cfgOptions})"
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
