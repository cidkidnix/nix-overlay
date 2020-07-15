{ stdenv, fetchFromGitHub, git, nodejs, nodePackages, discord }:

stdenv.mkDerivation rec {
  pname = "betterdiscordctl";
  version = "1.7.0";

  src = fetchFromGitHub {
    owner = "bb010g";
    repo = pname;
    rev = "785ad01257d2bfb0a194e618d1a86385f3b9eec8";
    sha256 = "0qpmm5l8jhm7k0kqblc0bnr9fl4b6z8iddhjar03bb4kqgr962fa";
  };

  pathAdd = stdenv.lib.makeSearchPath "/bin" [ git nodejs nodePackages.asar ];

  installPhase = ''
    sed -i "s@^scan=/opt@scan=${discord}/opt@g" betterdiscordctl
    sed -i 's/^DISABLE_UPGRADE=$/DISABLE_UPGRADE=yes/' betterdiscordctl
    sed -i 's/^global_asar=$/global_asar=yes/' betterdiscordctl
    sed -i -e '2i PATH="${pathAdd}:$PATH"' betterdiscordctl
    install -D betterdiscordctl $out/bin/betterdiscordctl
  '';

  meta = with stdenv.lib; {
    description = "A utility for managing BetterDiscord on Linux";
    homepage = https://github.com/bb010g/betterdiscordctl;
    license = licenses.mit;
    maintainers = with maintainers; [ tadeokondrak ];
    platforms = platforms.linux;
  };
}
