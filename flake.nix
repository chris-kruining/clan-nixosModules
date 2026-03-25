{
  nixConfig = {
    warn-dirty = false;
    extra-experimental-features = ["nix-command" "flakes" "pipe-operators"];
  };

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "clan-core/nixpkgs";
    };

    clan-core = {
      url = "https://git.clan.lol/clan/clan-core/archive/main.tar.gz";
      inputs.flake-parts.follows = "flake-parts";
    };

    nixpkgs.follows = "clan-core/nixpkgs";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    systems,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;

      imports = with inputs; [
        flake-parts.flakeModules.modules
        clan-core.flakeModules.default
        ./modules/flake-module.nix
      ];

      clan = {
        machines.my_machine = {};
      };
    };
}
