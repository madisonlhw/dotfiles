{ pkgs, ...}: {
   environment.systemPackages = with pkgs; [
      git
      curl
      wget
      vim
      signal-desktop
      ungoogled-chromium
   ];
}
