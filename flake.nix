{
  description = "NixOS configuration of PascalH214";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
    astal.url = "github:Aylur/astal";
    astal.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nur,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nixos = let
        username = "pascal";
        specialArgs = {inherit username;};
        system = "x86_64-linux";
        pkgsUnstable = import inputs."nixpkgs-unstable" {inherit system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          inherit system;

          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  nur = import inputs.nur {
                    nurpkgs = prev;
                    pkgs = prev;
                  };
                })
              ];
            }
            ./hosts/nixos
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.extraSpecialArgs =
                inputs //
                specialArgs //
                {
                  hyprMainMod = "SUPER";
                  inherit inputs;
                  inherit pkgsUnstable;
                  inherit username;
                };
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };

      laptop = let
        username = "pascal";
        specialArgs = {inherit username;};
        system = "x86_64-linux";
        pkgsUnstable = import inputs."nixpkgs-unstable" {inherit system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          inherit system;

          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  nur = import inputs.nur {
                    nurpkgs = prev;
                    pkgs = prev;
                  };
                })
              ];
            }
            ./hosts/nixos
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.extraSpecialArgs =
                inputs //
                specialArgs //
                {
                  hyprMainMod = "SUPER";
                  inherit inputs;
                  inherit pkgsUnstable;
                  inherit username;
                };
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };

      vm = let
        username = "pascal";
        specialArgs = {inherit username;};
        system = "x86_64-linux";
        pkgsUnstable = import inputs."nixpkgs-unstable" {inherit system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          inherit system;

          modules = [
            {
              nixpkgs.overlays = [
                (final: prev: {
                  nur = import inputs.nur {
                    nurpkgs = prev;
                    pkgs = prev;
                  };
                })
              ];
              nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
            }

            ./hosts/vm
            ./users/${username}/nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.extraSpecialArgs =
                inputs //
                specialArgs //
                {
                  hyprMainMod = "SHIFT_R ALT_R";
                  inherit inputs;
                  inherit pkgsUnstable;
                };
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}
