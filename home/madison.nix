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

         set nocompatible
         filetype plugin indent on
         syntax on
    '';
  };

  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      videoclip
    ];

    scriptOpts = {
      videoclip = {
        video_folder_path = "~/videos";
      };
    };

    config = {
      alang = "ja,jpn";
      slang = "en,eng,enUS";
      screenshot-directory = "~/screenshots";
      screenshot-template = "screenshot-%F_%P";
      sub-scale = 0.8;
      osd-duration = 500;
      osd-font-size = 25;
    };

    extraInput = ''
      KP7     add sub-scazle -0.05
      KP8     set sub-scale 1.0
      KP9     add sub-scale +0.05
      o       cycle-values osd-level 2 1
      s       screenshot video
      S       screenshot subtitles
      Ctrl+s  screenshot video+each-frame
    '';
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "sound";
          }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
          }
        ];
      };
    };
  };

  programs.home-manager.enable = true;
}
