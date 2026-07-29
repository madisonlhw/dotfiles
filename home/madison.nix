{ pkgs, ...}: {
   home.username = "madison";
   home.homeDirectory = "/home/madison";
   home.stateVersion = "26.05";

   home.packages = with pkgs; [
      hyfetch
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
      };
   };

   programs.home-manager.enable = true;
}
