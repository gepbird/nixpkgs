{ lib
, stdenv
, fetchFromGitHub
, zig_0_9
, xorg
, libudev-zero
, raylib
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "cleartouch";
  version = "0.1.0-unstable-2022-04-13";

  src = fetchFromGitHub {
    owner = "canadaduane";
    repo = "cleartouch";
    rev = "4c37c646845a15f328361931a0f35994d13be723";
    hash = "sha256-6rGt0ysG8Gcfu9siyfHIGdNA8/U8IhkF0cDEz0LPWAs=";
    fetchSubmodules = true;
  };

  patches = [
    ./raylib.patch
    ./libudev-zero.patch
  ];

  nativeBuildInputs = [
    zig_0_9.hook
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    #xorg.libXinerama
    xorg.xinput
    xorg.libXi.dev
    libudev-zero
    raylib
  ];
})
