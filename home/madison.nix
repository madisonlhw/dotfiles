{ pkgs, ...}: {
   home.username = "madison";
   home.homeDirectory = "/home/madison";
   home.stateVersion = "26.05";

   home.packages = with pkgs; [
      hyfetch
      gh
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

   programs.home-manager.enable = true;
}
