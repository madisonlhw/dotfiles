{
   description = "madison wass' configs for NixOS";
   
   inputs = {
     nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
     
     home-manager = {
        url = "github:nix-community/home-manager/release-26.05";
        inputs.nixpkgs.follows = "nixpkgs";
     };
   };

   outputs = { self, nixpkgs, home-manager, ...}@inputs: {
      nixosConfigurations.akatsuki = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux";
         modules = [
            ./common/global-packages.nix
            ./common/jpinput.nix
            ./common/yubikey.nix
            ./systems/akatsuki/hardware-configuration.nix
            ./systems/akatsuki/configuration.nix
            
            home-manager.nixosModules.home-manager {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.users.madison = import ./home/madison.nix;
            }
         ];
      };
   };
}
