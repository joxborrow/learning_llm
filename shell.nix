{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python313
    python313Packages.ipykernel
    python313Packages.pyzmq
    python313Packages.jupyter
    python313Packages.torch
    python313Packages.ipython
    python313Packages.numpy
    python313Packages.scikit-learn
    python313Packages.scipy
    python313Packages.setuptools
    stdenv.cc.cc.lib
  ];

  shellHook = ''
    echo "Nix Python development environment active."
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
  '';
}
