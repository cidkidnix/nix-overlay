# nix-overlay
Nix-Overlay, a combo of my gitlab repo and tdeo's repo while updated


- OpenTabletDriver
```{ config, lib, pkgs, ... }:
let
    rev-overlay = "master"
    url-overlay = "https://github.com/cidkidnix/nix-overlay/archive/${rev-overlay}.tar.gz";
    nix-overlay = (import (builtins.fetchTarball url-overlay));
in```

to the top of your configuration.nix
then add

```{
 nixpkgs.overlays = [ (nix-overlay) ];
 environment.systemPackages = with pkgs; [ opentabletdriver ];
}```

