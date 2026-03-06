{
  description= "a basic shell that can run opengl programs";

  inputs={
   nixpkgs.url="nixpkgs/nixos-25.11"; 
  };
  outputs ={self,nixpkgs}:
      let
      pkgs=nixpkgs.legacyPackages."x86_64-linux";
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
      
    in {
    devShells."x86_64-linux".default=pkgs.mkShell {
      packages = runtimeLibs ++ (with pkgs; [
        cmake
        pkg-config
        mesa-demos
      ]);

      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath runtimeLibs;

      shellHook = ''
        export PS1="$PS1\[\e[92m\]|glShell|\$\[\e[0m\]"
        echo "development environment created"
      '';
    };
  };
}


