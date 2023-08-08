{ username, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./nvim.nix
    ./kitty.nix
    ./firefox.nix
  ];
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.05";
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
    fzf = {
      enable = true;
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
      };
    };
  };
}

