{ pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "breeze";
      wayland.enable = true;
      enableHidpi = true;
      settings = {
        Autologin = {
          Session = "plasma.desktop";
          User = "dan-nix";
        };
      };
    };
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    ark
    okular
    konsole
    elisa
    kwallet
    qrca
  ];
}
