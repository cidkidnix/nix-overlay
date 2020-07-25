let
  pkgs = import <nixpkgs> {};
in

self: super: rec {
	srb2kart = super.callPackage ./pkgs/games/srb2kart {};
	liquidctl = super.callPackage ./pkgs/system-management/liquidctl {};
	looking-glass = super.callPackage ./pkgs/looking-glass-client {};
	betterdiscordctl = super.callPackage ./pkgs/net-im/betterdiscordctl {};
	legendary = super.callPackage ./pkgs/legendary {};
	opentabletdriver = super.callPackage ./pkgs/opentabletdriver {};
	opentabletdriver-git = super.callPackage ./pkgs/opentabletdriver-git {};
}
