{ config, lib, pkgs, ... }:

with lib;

let
   cfg = config.services.opentabletdriver;
in

{
   options.services.opentabletdriver = {
	enable = mkOption {
	   type = types.bool;
	   default = false;
	   description = "Enable opentablet driver";
	};
 
	package = mkOption {
	   type = types.package;
	   default = pkgs.opentabletdriver;
	   defaultText = "pkgs.opentabletdriver";
	   example = literalExampe "pkgs.opentabletdriver";
	   description = ''
		Choose OpenTabletDriver package
	   '';
	};

  };

   config = mkIf cfg.enable {
	systemd.user = {
	  services.opentabletdriver ={
<<<<<<< HEAD
	     wantedBy = [ "default.target" ];
=======
	     restartIfChanged = true;
>>>>>>> parent of 9571eb6... update opentabletdriver.nix
	     serviceConfig = {
		Type = "simple";
		ExecStart = ''
		  ${cfg.package}/bin/OpenTabletDriver.Daemon -c ${cfg.package}/lib/OpenTabletDriver/Configurations/
		'';
		Restart = "on-failure";
		RestartSec = 10;
	    };
	};
	};
	environment.systemPackages = [ cfg.package ];
	boot.kernelModules = [ "uinput" ];
	services.udev.extraRules = ''
		KERNEL=="uinput", GROUP="users",MODE="0660"
		# Wacom CTL-4100 Bluetooth
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0377", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0377", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom PTH-660
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0357", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0357", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTH-470
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00de", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00de", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-6100
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0378", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0378", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTH-490
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033c", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033c", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-672
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="037b", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="037b", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-470
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00dd", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00dd", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTE-440
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0015", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0015", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTH-480
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0302", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0302", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom PTH-850
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0028", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0028", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-460
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00d4", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00d4", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-471
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0300", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0300", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTH-690
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033e", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033e", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-490
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033b", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033b", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTH-670
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00df", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="00df", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-480
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="030e", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-680
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0323", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0323", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-472
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="037a", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="037a", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom PTH-660 Bluetooth
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0360", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0360", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-4100
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0374", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0374", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-690
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033d", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="033d", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTL-671
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0301", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0301", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom PTH-451
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0314", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0314", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Wacom CTH-680
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0303", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="056a", ATTRS{idProduct}=="0303", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Gaomon S620
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006d", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006d", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# VEIKK S640
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="2feb", ATTRS{idProduct}=="0001", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="2feb", ATTRS{idProduct}=="0001", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G540 Pro
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0061", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0061", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G640s
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0906", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0906", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G430S_B
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0913", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0913", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G430S
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0075", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0075", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G640 v2
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0914", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0914", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen Star 03v2
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0907", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0907", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G960 v2
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0920", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0920", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G430
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0075", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0075", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen G640
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0094", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0094", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen Deco 01
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0042", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0042", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen Deco 01 v2
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0902", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0902", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# XP-Pen Deco 02
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0803", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="28bd", ATTRS{idProduct}=="0803", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Huion HS64
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006d", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006d", ENV{LIBINPUT_IGNORE_DEVICE}="1"
		# Huion H420
		SUBSYSTEM=="hidraw", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006e", MODE="0666"
		SUBSYSTEM=="input", ATTRS{idVendor}=="256c", ATTRS{idProduct}=="006e", ENV{LIBINPUT_IGNORE_DEVICE}="1"
	'';
};
}
