{ stdenv, fetchgit, fetchurl, python, zip, pandoc, haskellPackages }:

let
  version = "2014.11.27";
in
stdenv.mkDerivation rec {
  name = "youtube-dl-${version}";

  #src = fetchurl {
  #  url = "http://youtube-dl.org/downloads/${version}/${name}.tar.gz";
  #  sha256 = "0bmjlp3jk5nd2i9jpbqbv2smh5rdxcjajv7fccfinmi6v2bjm1aa";
  #src = fetchurl {
  #  url = "http://youtube-dl.org/downloads/${version}/${name}.tar.gz";
  #  sha256 = "1c9d5wjl0aaqfvz868wbkr3dwby9vjkx0hkbnwx0wnpg48nlnwpm";
  #};
  src = fetchgit {
    url = "https://github.com/rg3/youtube-dl.git";
    rev = "1362bbbb4bfbd9380211a66032dbe3fe09aa2173"; #"fb17b60811ea89fb857ab03a997d193898046466";
  };
  buildInputs = [ python haskellPackages.pandoc];
  nativeBuildInputs = [ zip haskellPackages.pandoc];

  ##buildInputs = [ python ];
  ##nativeBuildInputs = [ zip pandoc ];

    #sed -i 's/pandoc/#pandoc/g' Makefile
  #patchPhase = ''
  #  rm youtube-dl
  #'';

  configurePhase = ''
    makeFlagsArray=( PREFIX=$out SYSCONFDIR=$out/etc PYTHON=${python}/bin/python )
  '';

  meta = {
    homepage = "http://rg3.github.com/youtube-dl/";
    repositories.git = https://github.com/rg3/youtube-dl.git;
    description = "Command-line tool to download videos from YouTube.com and other sites";
    license = stdenv.lib.licenses.unlicense;

    platforms = with stdenv.lib.platforms; linux ++ darwin;
    maintainers = with stdenv.lib.maintainers; [ bluescreen303 simons phreedom AndersonTorres ];
  };
}
