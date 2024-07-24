{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs { inherit system; };

    package = pkgs.callPackage ./todo_ocsigen.nix {};
  in {
    packages.default = package;
    packages.todo_ocsigen = package;

    devShells.default = pkgs.mkShell {
      inputsFrom = [
        package
      ];

      buildInputs = [
        pkgs.ocamlPackages.ocaml-lsp
        pkgs.ocamlPackages.utop
        pkgs.ocamlPackages.ocamlformat
        pkgs.nodejs
      ];
    };
  });
}
