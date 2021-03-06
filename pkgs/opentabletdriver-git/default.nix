{ stdenv
, lib
, buildEnv
, fetchFromGitHub
, fetchurl
, makeWrapper
, dotnetCorePackages
, dotnetPackages
, gtk3
, libX11
, libXrandr
, libevdev
, libappindicator
, libnotify
, wrapGAppsHook
}:

stdenv.mkDerivation rec {
  pname = "OpenTabletDriver-git";
  version = "0.3.0-git";

  src = fetchFromGitHub {
    owner = "InfinityGhost";
    repo = "OpenTabletDriver";
    rev = "99c75f20ee0758d379f235a35131cee6792d727f";
    sha256 = "wnvjvjap4z209h6m1z39fy4v32iz59xahizm7gsc0lzp84fi7y6";
  };

  nativeBuildInputs = [
    dotnetCorePackages.sdk_3_1
    makeWrapper
    wrapGAppsHook
  ];

  deps = buildEnv {
    name = "${pname}-deps";

    paths = lib.forEach (import ./opentabletdriver-deps.nix) ({ name, version, sha256 }:
      stdenv.mkDerivation {
        inherit name;

        src = fetchurl {
          url = "https://www.nuget.org/api/v2/package/${name}/${version}";
          inherit sha256;
        };

        nativeBuildInputs = [ dotnetPackages.Nuget ];

        dontUnpack = true;
        dontConfigure = true;
        dontInstall = true;

        buildPhase = ''
          export HOME=$(mktemp -d)
          nuget sources Disable -Name nuget.org
          nuget add $src -Source $out
        '';
      }
    );
  };

  runtimeDeps = [
    gtk3
    libX11
    libXrandr
    libevdev
    libappindicator
    libnotify
  ];
 
  configurePhase = ''
    export HOME=$(mktemp -d)
  '';

  buildPhase = ''
    export HOME=$(mktemp -d)
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    dotnet restore --source $deps
    for project in OpenTabletDriver.{Console,Daemon,UX.Gtk}; do
        dotnet build $project \
          --no-restore \
          --configuration Release \
          --framework netcoreapp3.1
    done
  '';

  installPhase = ''
    mkdir -p $out/lib/OpenTabletDriver/
    cp -r ./TabletDriverLib/Configurations/ $out/lib/OpenTabletDriver/
    for project in OpenTabletDriver.{Console,Daemon,UX.Gtk}; do
      dotnet publish $project \
          --no-build \
          --no-self-contained \
          --configuration Release \
          --framework netcoreapp3.1 \
          --output $out/lib
      makeWrapper $out/lib/$project $out/bin/$project \
          "''${gappsWrapperArgs[@]}" \
          --prefix XDG_DATA_DIRS : "${gtk3}/share/gsettings-schemas/${gtk3.name}/" \
          --set DOTNET_ROOT "${dotnetCorePackages.netcore_3_1}" \
          --suffix LD_LIBRARY_PATH : "${lib.makeLibraryPath runtimeDeps}"
    done
  '';

  dontWrapGApps = true;
  dontStrip = true;
}
