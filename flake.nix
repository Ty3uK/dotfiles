{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
            home-manager.users.ty3uk = ./home.nix;
          }
        ];
      };
    };
    # nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    #   modules = [ ./configuration.nix ];
    # };
    # homeConfigurations.ty3uk = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #   extraSpecialArgs = { inherit inputs; backupFileExtension = "backup"; };
    #   modules = [ ./home.nix ];
    # };
  };
}
