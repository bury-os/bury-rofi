# BuryOS Rofi configuration

This repository contains the Rofi configuration for BuryOS.

## Usage

### Manual install

Copy or symlink the `./src` directory to `~/.config/rofi`:

```bash
cp -r ./src ~/.config/rofi
```

### NixOS

The flake assumes a home manager setup and symlinks the ./src directory as `~/.config/rofi`.

Add the input to your `flake.nix`:

```nix
# flake.nix
{
  inputs = {
    bury-rofi = {
      url = "github:bury-os/bury-rofi";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Import the bury-rofi NixOS module in your NixOS config. This handles environment wide settings such as setting the correct `BURYOS_` environment variables (important for BuryOS to know which launcher to use).

```nix
# configuration.nix
{
  imports = [
    inputs.bury-rofi.nixosModules.default
  ];
}
```

Import the `bury-rofi` Home Manager module in your Home Manager config. This handles all the `~/.config/rofi` files setting up Rofi with the custom configs.

```nix
# home.nix
{
  imports = [
    inputs.bury-rofi.homeManagerModules.default
  ];
}
```
