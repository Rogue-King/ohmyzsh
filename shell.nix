{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.fetchgit
  ];

  shellHook = ''
    echo "You can now build the package with: nix-build"
  '';
}