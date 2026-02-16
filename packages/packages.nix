{config,pkgs,inputs, ...}:
{

  # Enable desktop environments.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.hyprland.enable= true;

  # Installing programs that need to be installed via program.enable.
  programs.firefox.enable = true;
  programs.waybar.enable=true;
 

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
    wofi
#    inputs.zen-browser.packages."x86_64-linux".default
    gnumake
    cmake
    pkg-config
    mesa-demos
    grim
    satty
    wl-clipboard-rs
    swaynotificationcenter
    libnotify
    hyprpaper
    localsend
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








}
