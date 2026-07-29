{ pkgs, ...}: {
   environment.systemPackages = with pkgs; [
      git
      gh
      curl
      wget
      vim
      signal-desktop
      ungoogled-chromium
   ];
}
