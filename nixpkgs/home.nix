{ pkgs, ... }:

let
  keepassWithPlugins = pkgs.keepass.override {
    plugins = [ pkgs.keepass-keepasshttp ];
  };
in

{
  nixpkgs.config.allowUnfree = true;
  imports = [ ./i3.nix ./termite.nix ./tmux.nix ./vim.nix ];
  # imports = [ ./i3.nix ./tmux.nix ./vim.nix ];

  home.packages = [
    # pkgs.adobe-reader
    (pkgs.aspellWithDicts(d: with d; [ de en ]))
    pkgs.autojump
    pkgs.bat
    pkgs.chromium
    pkgs.direnv
    pkgs.emacs
    pkgs.evince
    # pkgs.font-awesome
    pkgs.htop
    pkgs.i3lock-fancy
    # pkgs.jetbrains.idea-ultimate
    keepassWithPlugins
    pkgs.fd
    pkgs.fortune
    # Following is needed for i3 bar. Need to figure out, how to put
    # this into i3 config.
    (pkgs.python36.withPackages(ps: with ps; [ netifaces pip psutil requests ]))
    #pkgs.termite
    pkgs.thunderbird
    # pkgs.virtualbox
    pkgs.zsh-powerlevel9k
  ];
  # ++
  # This should move to a haskell related nix config
  # [
  #  pkgs.cabal-install
  #  pkgs.cabal2nix
  #  pkgs.nix-prefetch-git
  #];

  # home.packages = [ idea-ultimate ];

  programs.firefox = {
    enable = true;
    # enableIcedTea = true;
    # enableAdobeFlash = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Juri Pärn";
    userEmail = "juri.paern@gmail.com";
    extraConfig = {
      core = {
        whitespace = "trailing-space,space-before-tab";
        editor = "vim";
      };
    };
  };

  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-20.03.tar.gz;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["autojump" "colorize" "common-aliases" "docker" "history"
                 "git" "tig" "tmux" "vim-interaction" "vi-mode"
                 "zsh-navigation-tools"];
      # theme = "robbyrussell";
      theme = "agnoster";
      # theme = "powerlevel9k";
    };
    # shellInit = "eval \"$(direnv hook zsh)\"";
    #promptInit = ''
    #  source /run/current-system/sw/share/zsh-powerlevel9k/powerlevel9k.zsh-theme
    #  ZSH_THEME="powerlevel9k"
    #'';
  };

  services = {
    network-manager-applet.enable = true;
    screen-locker = {
      enable = true;
      inactiveInterval = 5;
      lockCmd = "\${pkgs.i3lock}/bin/i3lock-fancy";
    };
    #openvpn = {
    #  servers = {
    #    otto = {
    #      config = '' config /home/juri/.openvpn/otto.ovpn '';
    #    };
    #  };
    #};
  };
}
