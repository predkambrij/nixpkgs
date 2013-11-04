{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  name = "mp3gain-${version}";
  version = "1.5.2r2";

  src = fetchurl {
    url = "mirror://sourceforge/mp3gain/mp3gain-1_5_2_r2-src.zip";
    sha256 = "03r6cifinnsrgdjq3cd68pp3cpvj5flzc0i8c9blzh9khcnd6y1k";
  };

  sourceRoot = ".";

  buildInputs = [ unzip ];

  preBuild = ''
    mkdir -p $out/bin
    substituteInPlace "./Makefile" --replace "/usr/local/bin" "$out/bin"
  '';

  meta = with stdenv.lib; {
    homepage = http://mp3gain.sourceforge.net/;
    description = "MP3Gain analyzes and adjusts mp3 files so that they have the same volume";
  };
}
