{stdenv, fetchurl}:

stdenv.mkDerivation rec {
  name = "stress-1.0.4";

  src = fetchurl {
    url = "http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz";
    sha256 = "057e4fc2a7706411e1014bf172e4f94b63a12f18412378fca8684ca92408825b";
    #sha256 = "f6642ae62ae0eb16368bce29181a15c7743129ea51c7184f45e161e21db3360b";
  };

  meta = {
    description = "stress is a deliberately simple workload generator for POSIX systems";
    homepage = "http://people.seas.harvard.edu/~apw/stress/";
    license = "GPL2";
    maintainers = stdenv.lib.maintainers.predkambrij;
  };
}

