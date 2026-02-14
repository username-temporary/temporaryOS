{config,pkgs,inputs, ...}:
{


  # Enable desktop environments.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.hyprland.enable= true;

  # Installing programs that need to be installed via program.enable.
  programs.firefox.enable = true;
 

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #enabling opengl
  hardware.graphics.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git 
    wget
    kitty
    steam-run
#    inputs.zen-browser.packages."x86_64-linux".default
  ];
  #this should let us use binaries
  programs.nix-ld.enable=true;
  programs.nix-ld.libraries=with pkgs;[
    #put libraries here I guess
      bash
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      cairo
  ];
  #setting up openvpn
  services.openvpn.servers = {
    VPN  = { config = ''config /home/strats/.vpn/VPN.ovpn''; };
  };

  users.users.strats.packages =  [
    #  thunderbird
    inputs.zen-browser.packages."x86_64-linux".default
    ];








}
