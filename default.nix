{
  lib,
  stdenv,
  fetchFromGitHub,
  xfce,
  bash,
  cmake,
  coreutils,
  fakeroot,
  gcc,
  gnumake,
  pkg-config,
  python312Full,
  ...
}:
stdenv.mkDerivation rec {
  pname = "xfce-winxp-tc";
  version = "45a78d3";

  buildInputs = [
    bash
    cmake
    coreutils
    fakeroot
    gcc
    gnumake
    pkg-config
    python312Full
  ];

  src = fetchFromGitHub {
    owner = "rozniak";
    repo = "xfce-winxp-tc";
    rev = "${version}";
    hash = "";
  };

  
}