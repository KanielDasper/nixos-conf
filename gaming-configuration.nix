{
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
  };

  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
}
