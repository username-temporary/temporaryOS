{
  description="the main flake for this config";
  #we define all of the inputs to our flake in here
  inputs={
    nixpkgs= {
      url="nixpkgs/nixos-25.11";
    };    

    #adding my shell for opengl programs
    glShell={
      url="path:/etc/nixos/shells/glShell/";
      inputs.nixpkgs.follows="nixpkgs";
    };
     defaultShell={
      url="path:/etc/nixos/shells/default/";
      inputs.nixpkgs.follows="nixpkgs";
    };   
    zen-browser={

      url =   "github:youwen5/zen-browser-flake" ;
      inputs.nixpkgs.follows="nixpkgs";
    };
    home-manager={
      url= "github:nix-community/home-manager";
      inputs.nixpkgs.follows="nixpkgs";
    };
    nvf={
      url="github:notashelf/nvf";
      inputs.nixpkgs.follows="nixpkgs";
    };
  };
  #and here we define how those inputs will be used to create a system
  outputs={self,nixpkgs, ... }@ inputs:
  let 
    pkgs=nixpkgs.legacyPackages.x86_64-linux;
    lib=nixpkgs.lib;
  in {
    nixosConfigurations={
      #temporary is the name of our desktop configuration but you could easily add other 
      #configuration files here
      temporaryOS=lib.nixosSystem{
        specialArgs={inherit inputs;};
        system="x86_64-linux";
        modules=[
        inputs.nvf.nixosModules.default
        ./nvim/config.nix 
        ./configuration.nix 
        ./hardware/laptop.nix];
      };
      temporaryOSDesktop=lib.nixosSystem{
        specialArgs={inherit inputs;};
        system="x86_64-linux";
        modules=[
        inputs.nvf.nixosModules.default
        ./nvim/config.nix 
        ./configuration.nix 
        ./hardware/desktop.nix];
      };
    };
    devShells."x86_64-linux"={
      glShell=inputs.glShell.devShells."x86_64-linux".default; 
      default=inputs.defaultShell.devShells."x86_64-linux".default; 
    };
    packages."x86_64-linux".nvim =
      (inputs.nvf.lib.neovimConfiguration{
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./nvim/config.nix];
      }).neovim; 
    
  #closing outputs
  };
}
