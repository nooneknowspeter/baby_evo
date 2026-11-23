{
  description = "project baby_evo";

  inputs = {
    excalidraw-edit = {
      url = "github:wh1le/excalidraw-edit";
    };

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
          orca-slicer
        ];

        dev_pkgs = with pkgs; [
          git
          just
          opencode
        ];

        pandoc_38 = pkgs.stdenv.mkDerivation {
          pname = "pandoc";
          version = "3.8";
          src = pkgs.fetchurl {
            url = "https://github.com/jgm/pandoc/releases/download/3.8/pandoc-3.8-linux-amd64.tar.gz";
            hash = "sha256-GgNcH30pXDU/YURh+kvBPXA8DoZTh9RDQdFVbXA95Zo=";
          };
          installPhase = ''
            mkdir -p $out/bin $out/share
            cp -r bin/* $out/bin/
            cp -r share/* $out/share/
          '';
        };

        quarto_rollback = pkgs.quarto.overrideAttrs (old: {
          version = "1.9.37";
          src = pkgs.fetchurl {
            url = "https://github.com/quarto-dev/quarto-cli/releases/download/v1.9.37/quarto-1.9.37-linux-amd64.tar.gz";
            hash = "sha256-ePzZDpg+Pn2+Pw0ZIcwQJTweynuSwg3UvCo8G8oKmvU=";
          };
          buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.openssl ];
        });

        doc_pkgs = with pkgs; [
          inputs.excalidraw-edit.packages.${system}.default
          pandoc
          quarto_rollback
        ];

        fmt_pkgs = with pkgs; [
          treefmt

          nixfmt
          prettier
          taplo
          zig
        ];
      in
      {

        devShells = {
          default = pkgs.mkShell {
            packages = runtime_and_compiler_pkgs ++ dev_pkgs ++ engineering_pkgs ++ doc_pkgs ++ fmt_pkgs;

            shellHook = ''
              export QUARTO_PANDOC=${pandoc_38}/bin/pandoc
            '';
          };

          docs = pkgs.mkShell {
            packages = doc_pkgs;

            shellHook = ''
              export QUARTO_PANDOC=${pandoc_38}/bin/pandoc
            '';
          };

          fmt = pkgs.mkShell {
            packages = fmt_pkgs;
          };
        };

      }
    );
}
