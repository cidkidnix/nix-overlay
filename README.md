# nix-overlay
Nix-Overlay, a combo of my gitlab repo and tdeo's repo while updated


- OpenTabletDriver
add 
```nix
{ config, lib, pkgs, ... }:
let
    rev-overlay = "master";
    url-overlay = "https://github.com/cidkidnix/nix-overlay/archive/${rev-overlay}.tar.gz";
    nix-overlay-modules = builtins.fetchTarball url-overlay;
    nix-overlay = (import (builtins.fetchTarball url-overlay));
in
```

to the top of your configuration.nix
then add

```nix 
{
 imports = [
    ...
    "${nix-overlay-modules}/opentabletdriver.nix"
  ];


 nixpkgs.overlays = [ (nix-overlay) ];
 environment.systemPackages = with pkgs; [ opentabletdriver ];
}
```

