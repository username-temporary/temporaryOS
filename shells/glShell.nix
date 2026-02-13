{ pkgs ? import <nixpkgs> {} }:

let
  runtimeLibs = with pkgs; [
    glfw
    mesa
    libglvnd
    xorg.libX11
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXi
    libxkbcommon
    wayland
  ];
in
pkgs.mkShell {
  packages = runtimeLibs ++ (with pkgs; [
    cmake
    pkg-config
    mesa-demos
  ]);

  LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath runtimeLibs;

  shellHook = ''
    echo "development environment created"
  '';
}


