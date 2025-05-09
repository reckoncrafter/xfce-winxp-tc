with import <nixpkgs> { };
stdenv.mkDerivation rec {
  pname = "xfce-winxp-tc";
  version = "45a78d3";

  buildInputs = with pkgs; [
    git
    bash
    cmake
    coreutils
    fakeroot
    gcc
    gnumake
    pkg-config
    python312Full
    xorg.xcursorgen
    xfce.garcon
    sass
    libpulseaudio
    glib
    webkitgtk_4_1
    libzip
    upower
    networkmanager
    libcanberra
    lightdm
  ];
  
  src = ./.;

  buildPhase = ''
  cd $src/packaging
  CFLAGS = '-w' ./buildall.sh -z
  '';

  installPhase = ''
  # Package shared libraries

  cd $src/packaging/build/shared
  lib_list=$(find . -mindepth 1 -maxdepth 1 -type d)
	for lib in $lib_list; do
		cd "$lib"
		make DESTDIR="$out/" install
		cd -
	done

  # Package components
  cd $src/packaging/build
	comp_list=$(sed 's/#.*$//g' < "../targets")
	for comp in $comp_list; do
		cd "$comp"
		make DESTDIR="$out/" install
		cd -
	done
  '';


  
}