{ config, pkgs, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.modesetting.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.wallpaper.mode = "fill";

    windowManager.i3 = {
      enable = true;
      configFile = ../i3/config;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };

  fonts.packages = with pkgs; [
    overpass
  ];
}
