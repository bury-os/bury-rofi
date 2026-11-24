{
  description = "BuryOS Hyprland configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ... }: {

    # Home-manager support (HOME configs)
    homeManagerModules.default = { pkgs, ... }: {
      # Bind the configuration files
      xdg.configFile."rofi" = {
        source = ./src;
        recursive = true;
      };

      # Packages used in various plugins and modules (launcher, screenshots, etc)
      home.packages = with pkgs; [
        rofi
      ];
    };
  };
}
