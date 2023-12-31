{ username, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./kitty.nix
    ./neovim
    # ./nvim.nix
    ./vorta.nix
    ./zsh.nix
  ];
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.05";
  home.file.".face".source = ./face.jpg;
  home.packages = with pkgs; [
    telegram-desktop
    bat
    bitwarden
    btop
    cava
    element-desktop
    erdtree
    fd
    htop-vim
#    kitty
    kitty-themes
    lazygit
    lf
    libreoffice-fresh
    logseq
    micro
    mullvad-browser
#    neovim
    picom
    polybar
    protonvpn-gui
    protonvpn-cli
    ripgrep
    signal-desktop
    standardnotes
    sxhkd
    tailscale
    tldr
    tmux
    tor-browser-bundle-bin
    ueberzugpp
    graphicsmagick
    ffmpeg
    ffmpegthumbnailer
    zathura
    poppler
    ghostscript
    xclip
    yt-dlp
    zoxide
  ];
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
    exa = {
      enable = true;
      enableAliases = true;
      git = true;
      icons = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    fzf = {
      enable = true;
      # catppuccin theme
      colors = {
        "bg+" = "#313244";
        "bg" = "#1e1e2e";
        "spinner" = "#f5e0dc";
        "hl" = "#f38ba8";
        "fg" = "#cdd6f4";
        "header" = "#f38ba8";
        "info" = "#cba6f7";
        "pointer" = "#f5e0dc";
        "marker" = "#f5e0dc";
        "fg+" = "#cdd6f4";
        "prompt" = "#cba6f7";
        "hl+" = "#f38ba8";
      #  Tokyo Night theme
      # colors = {
      #   "bg+" = "#000000";
      #   "bg" = "#004687";
      #   "spinner" = "#00ffd2";
      #   "hl" = "#ff4499";
      #   "fg" = "#004687";
      #   "header" = "#ff4499";
      #   "info" = "#e0af68";
      #   "pointer" = "#00ffd2";
      #   "marker" = "#00ffd2";
      #   "fg+" = "#004687";
      #   "prompt" = "#e0af68";
      #   "hl+" = "#ff4499";
      };
    };
  };
}

