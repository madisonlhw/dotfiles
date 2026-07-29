{ config, pkgs, ... }: {
   fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
   ];

   i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
         fcitx5-mozc-ut
         fcitx5-gtk
         qt6Packages.fcitx5-configtool
      ];
   };

   environment.variables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
   };

   services.xserver.xkb = {
      layout = "us,jp";
      variant = "";
   };

   services.xserver.windowManager.i3.extraSessionCommands = ''
      fcitx5 -d &
   '';
}
