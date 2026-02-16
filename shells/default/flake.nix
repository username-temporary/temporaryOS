{
  description= "a basic shell ";

  inputs={
   nixpkgs.url="nixpkgs/nixos-25.11"; 
  };
  outputs ={self,nixpkgs}:
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in{
    devShells."x86_64-linux".default=pkgs.mkShell {

      shellHook = ''
        export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
        export PS1="$PS1\[\e[92m\]|nix-ld|\$\[\e[0m\]"
        echo "LD_LIBRARY_PATH set"
      '';
    };
  };
}


