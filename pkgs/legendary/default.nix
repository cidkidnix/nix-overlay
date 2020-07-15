{ lib
, python38Packages
, stdenv
}:

python38Packages.buildPythonApplication rec {
	pname = "legendary-gl";
	version = "0.0.18";
	
	src = python38Packages.fetchPypi {
		inherit pname version;
		sha256 = "0x7xcaj0hkmmdmq14jdky8c6xfkfz20swp05wgil56ql1y1838i8";
	};
	
	propagatedBuildInputs = with python38Packages; [ requests ];
	
	meta = with stdenv.lib; {
		description = "Legendary launcher, for EGS";
		license = "liscenses.gpl3";
		platforms = platforms.linux;
		maintainers = with maintainers; [ cidkid ];
	};
}
