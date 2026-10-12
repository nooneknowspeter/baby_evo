{
  description = "project baby_evo";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;

          config = {
            allowUnfree = true;
          };
        };

        engineering_pkgs = with pkgs; [
          freecad
        ];

        dev_pkgs = with pkgs; [
          git
        ];
      in
      {

        devShells = {
          default = pkgs.mkShell {
            packages = dev_pkgs ++ engineering_pkgs;
          };
        };

      }
    );
}
