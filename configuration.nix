{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./gaming-configuration.nix
    ./desktop-configuration.nix
  ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };
  console.keyMap = "dk-latin1";
  users.users."dan-nix" = {
    isNormalUser = true;
    description = "Nix Machine";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
  environment.localBinInPath = true;

  environment.systemPackages = with pkgs; [
    uv
    git
    nixd
    nixfmt
    wget
    neovim
    rustup
    discord
    ghostty
    protonup-qt
    thunderbird
    input-remapper
    zathura
    nodejs_26
    ripgrep
    tmux
  ];

  programs = {
    firefox.enable = true;
    nix-ld.enable = true;
  };

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.input-remapper = {
    enable = true;
    enableUdevRules = true;
  };
  environment.etc."xdg/autostart/input-remapper-autoload.desktop".source =
    "${config.services.input-remapper.package}/share/applications/input-remapper-autoload.desktop";

  system.stateVersion = "26.05"; # Did you read the comment?
}
