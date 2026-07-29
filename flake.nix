{
  description = "madison wass' configs for NixOS";
   
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
     
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f nixpkgs.legacyPackages.${system});
    in
    {
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

      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            gcc
            gnumake
            cmake
            pkg-config
            gdb
            valgrind
            clang-tools
            nodejs

            (vim-full.customize {
              name = "vim";
              vimrcConfig.packages.myVimPackages = {
                start = with pkgs.vimPlugins; [
                  coc-nvim
                  coc-clangd
                ];
              };

              vimrcConfig.customRC = ''
                set number
                set relativenumber

                set statusline+=%{\ '[C-Dev\ Shell]'}
                echo "C-Dev configuration loaded!"
              '';
            })
          ];

          shellHook = ''
            OLD_PS1="$PS1"
            export PS1="\[\033[1;35m\][C-Dev]\[\033[0m\] \u@\h:\w\$ "

            echo "<<< C Development Environment >>>"
            echo "Architecture Target: ${pkgs.system}"
            echo "Compiler: $(cc --version | head -n 1)"
          '';
        };
      });
    };
}
