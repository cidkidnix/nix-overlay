{ stdenv, fetchgit, fetchpatch
, cmake, pkgconfig, SDL2, SDL, SDL2_ttf, openssl, spice-protocol, fontconfig
, libX11, freefont_ttf, nettle, libconfig, wayland, libpthreadstubs, libXdmcp
, libXfixes, libbfd, libffi, expat, libXi
}:

stdenv.mkDerivation rec {
  pname = "looking-glass";
  version = "d579705b100a2a473ff9c6d979286c510fe3c40f";

  src = fetchgit {
	url = "https://github.com/gnif/LookingGlass.git";
	rev = "d579705b100a2a473ff9c6d979286c510fe3c40f";
	sha256 = "0xcnvn7b621sxzld53csrm257agz5bizxl4bnjqwx8djpj0yhv6x";
  	fetchSubmodules = true;
  };

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [
    SDL SDL2 SDL2_ttf openssl spice-protocol fontconfig
    libX11 freefont_ttf nettle libconfig wayland libpthreadstubs
    libXdmcp libXfixes libbfd cmake libffi expat libXi
  ];

  enableParallelBuilding = true;

  sourceRoot = [ "LookingGlass-d579705/client" ];

  installPhase = ''
    mkdir -p $out/bin
    mv looking-glass-client $out/bin
  '';

  meta = with stdenv.lib; {
    description = "A KVM Frame Relay (KVMFR) implementation";
    longDescription = ''
      Looking Glass is an open source application that allows the use of a KVM
      (Kernel-based Virtual Machine) configured for VGA PCI Pass-through
      without an attached physical monitor, keyboard or mouse. This is the final
      step required to move away from dual booting with other operating systems
      for legacy programs that require high performance graphics.
    '';
    homepage = "https://looking-glass.hostfission.com/";
    license = licenses.gpl2Plus;
    maintainers = [ maintainers.alexbakker maintainers.cidkid ];
    platforms = [ "x86_64-linux" ];
  };
}
