{config,pkgs,inputs, ...}:
{

  # Enable desktop environments.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.hyprland.enable= true;

  # Installing programs that need to be installed via program.enable.
  programs={
    firefox.enable = true;
    waybar.enable=true;
    neovim.enable=true;
  };

  services.flatpak.enable = true; 
  security.polkit.enable =true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  #enabling opengl
  hardware.graphics.enable = true;
  #nessisary for distrobox
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  environment.systemPackages = with pkgs; [
  # List packages installed in system profile. To search, run:
  # $ nix search wget
    htop
    texliveFull
    zathura
    vim 
    git 
    wget
    kitty
    nwg-look
    wofi
    steam-run
#    inputs.zen-browser.packages."x86_64-linux".default
    gnumake
    fastfetch
    cmake
    pkg-config
    mesa-demos
    grim
    hyprpolkitagent
    satty
    wl-clipboard-rs
    swaynotificationcenter
    libnotify
    hyprpaper
    localsend
    python3
    curl
    unzip
    gnutar
    gzip
    distrobox
    rpi-imager
  ];
  
  #picking a font
  fonts.packages=[ pkgs.nerd-fonts.fira-mono];
  #setting up openvpn
  services.openvpn.servers = {
    VPN  = { config = ''config /home/strats/.vpn/VPN.ovpn''; };
  };

  users.users.strats.packages =  [
    #  thunderbird
    inputs.zen-browser.packages."x86_64-linux".default
    ];
  


  #stolen snippet from a reddit post to let me mount my drive properly 
    security.polkit.extraConfig = ''
    /* Allow local users to mount system disks */
    polkit.addRule(function(action, subject) {
      if ( subject.local && action.id == "org.freedesktop.udisks2.filesystem-mount-system") {
        return polkit.Result.YES;
      }
  });
  '';


}
