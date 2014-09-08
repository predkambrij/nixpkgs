{ fetchurl, stdenv, glib, pkgconfig, udev }:

stdenv.mkDerivation rec {
  name = "libwacom-0.10";

  src = fetchurl {
    url = "mirror://sourceforge/linuxwacom/libwacom/${name}.tar.bz2";
    sha256 = "8eb714496bd340861b4a55a59744bce041156998700ee6d4c87dd5036e7eba00";
    #sha256 = "1agdaa1bv5mp4l32qgsw63swnnv0p279jiy9madgw4y3d8d12dwm";
  };

  buildInputs = [ glib pkgconfig udev ];

  meta = with stdenv.lib; {
    platforms = platforms.linux;
    homepage = http://sourceforge.net/projects/linuxwacom/;
    description = "libraries, configuration, and diagnostic tools for Wacom tablets running under Linux";
  };

}
