{ stdenv
, fetchFromGitHub
, fetchurl
, libarchive
, pkgconfig
, cmake
, libgme
, zlib
, libpng
, SDL2
, SDL2_mixer
, curl
, makeWrapper 
}:

stdenv.mkDerivation rec {
  pname = "srb2kart";
  version = "1.2";

  src = fetchFromGitHub {
    owner = "STJr";
    repo = "Kart-Public";
    rev = "v${version}";
    sha256 = "1rad90s01cdhbj3ksgz5gzpfvj8xjf3nbi76mkcycg44p5lrc3fz";
  };

  installer = fetchurl {
    url = "https://github.com/STJr/Kart-Public/releases/download/v1.2/srb2kart-v12-Installer.exe";
    sha256 = "1v5zxc5ss7pdpq617xpf3g9zr590y9yygzp81jkc12987bj4sa2p";
  };

  postUnpack = ''
    mkdir -p source/assets/installer
    ${libarchive}/bin/bsdtar xvf $installer -C source/assets/installer \
        {music,textures,gfx,maps,sounds,chars,bonuschars,patch}.kart srb2.srb
  '';

  nativeBuildInputs = [
    pkgconfig
    cmake
    makeWrapper
	];

  buildInputs = [
    libgme
    zlib
    libpng
    SDL2
    SDL2_mixer
    curl
  ];

  cmakeFlags = [
    "-DGME_INCLUDE_DIR=${libgme}/include"
    "-DSDL2_INCLUDE_DIR=${SDL2.dev}/include/SDL2"
    "-DCURL_INCLUDE_DIR=${curl}/include/curl"
 ];

  postInstall = ''
	mkdir -p $out/opt/srb2kart $out/bin/
	mv * $out/opt/srb2kart
	makeWrapper $out/srb2kart $out/bin/srb2kart \
	--prefix SRB2WADDIR : $out/ 
	'';

  meta = with stdenv.lib; {
      description = "Srb2kart";
      license = "liscenses.unfree";
      platforms = platforms.linux;
      maintainers = with maintainers; [ tadeokondrak cidkid ];
  };
}
