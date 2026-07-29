{ pkgs, ...}: {
  home.username = "madison";
  home.homeDirectory = "/home/madison";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    hyfetch
    gh
    alacritty
    discord-ptb
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Madison Wass";
        email = "madison@ccerailway.com";
      };
      init.defaultBranch = "main";
      core.editor = "vim";
      safe.directory = "/home/madison/.dotfiles";
    };
  };

  programs.alacritty = {
    enable = true;
    settings.font = {
      normal = {
        family = "Overpass Mono";
        style = "Regular";
      };
      bold = {
        family = "Overpass Mono";
        style = "Bold";
      };
      italic = {
        family = "Overpass Mono";
        style = "Italic";
      };
    };

    settings.colors = {
      primary = {
        background = "0x1c1b2e";
        foreground = "0xe8e6f2";
      };
      cursor = {
        text       = "0x1c1b2e";
        cursor     = "0xf6a35c";
      };
      normal = {
        black      = "0x2a2740";
        red        = "0xeb6f92";
        green      = "0x9dc08b";
        yellow     = "0xf6c177";
        blue       = "0xc4a7e7";
        magenta    = "0xcf9bc4";
        cyan       = "0x8ec7d0";
        white      = "0xb9b6cf";
      };
    };   
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
    ];
    extraConfig = ''
         set tabstop=4
         set softtabstop=4
         set shiftwidth=4
         set expandtab
    '';
  };

  programs.home-manager.enable = true;
}
