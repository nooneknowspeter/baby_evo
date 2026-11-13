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

        runtime_and_compiler_pkgs = with pkgs; [
          zig
        ];

        engineering_pkgs = with pkgs; [
          freecad
        ];

        dev_pkgs = with pkgs; [
          git
        ];

        fmt_pkgs = with pkgs; [
          treefmt
        ];
      in
      {

        devShells = {
          default = pkgs.mkShell {
            packages = runtime_and_compiler_pkgs ++ dev_pkgs ++ engineering_pkgs ++ fmt_pkgs;
          };

					fmt = pkgs.mkShell {
						packages = fmt_pkgs;
					};
        };

      }
    );
}
