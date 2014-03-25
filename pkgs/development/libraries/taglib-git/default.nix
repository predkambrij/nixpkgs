{stdenv, fetchgit, zlib, cmake}:

stdenv.mkDerivation rec {
  name = "taglib-git";

  src = fetchgit {
    #url = "https://github.com/downloads/taglib/taglib/${name}.tar.gz";
    url = "https://github.com/taglib/taglib.git";
    rev = "cfb43223dcfb534fb95e770fa7cdb434f9d90315";
  };

  cmakeFlags = "-DWITH_ASF=ON -DWITH_MP4=ON";

  buildInputs = [zlib];
  nativeBuildInputs = [cmake];

  meta = {
    homepage = http://developer.kde.org/~wheeler/taglib.html;
    description = "A library for reading and editing the meta-data of several popular audio formats";
    inherit (cmake.meta) platforms;
    maintainers = [ stdenv.lib.maintainers.urkud ];
  };
}
