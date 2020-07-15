{ stdenv
, lib
, python3Packages
, libusb
,  
}:

python3Packages.buildPythonApplication rec {
	pname = "liquidctl";
	version = "1.3.3";

	src = python3Packages.fetchPypi {
		inherit pname version;
		sha256 = "090cq4xncxlfbryyvaa98mwl7qszykl104gyj1c0qhh7gs380cfi";
	};

	BuildInputs = [ libusb ];
	propagatedBuildInputs = with python3Packages; [ setuptools docopt pyusb hidapi ];

	meta = with stdenv.lib; {
      description = "Liquidctl is a management tool for RGB";
      license = "liscenses.gpl3";
      platforms = platforms.linux;
      maintainers = with maintainers; [ cidkid ];
	};
}
