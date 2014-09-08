{ stdenv, fetchurl, pkgconfig, intltool, libxfce4util, xfce4panel, libxfce4ui, libxfcegui4, xfconf, gtk}:

stdenv.mkDerivation rec {
  p_name  = "xfce4-genmon-plugin";
  ver_maj = "3.4";
  ver_min = "0";

  src = fetchurl {
    url = "mirror://xfce/src/panel-plugins/${p_name}/${ver_maj}/${name}.tar.bz2";
    sha256 = "b0a5337b49c85623dc89f3c9e47c7374b1d466af2418033d2d6dfc57a9790387";
  };
  name = "${p_name}-${ver_maj}.${ver_min}";

  buildInputs = [ pkgconfig intltool libxfce4util libxfce4ui xfce4panel libxfcegui4 xfconf gtk ];
  #preFixup = "rm $out/share/icons/hicolor/icon-theme.cache";

  meta = {
    homepage = "http://goodies.xfce.org/projects/panel-plugins/${p_name}";
    description = "Panel custom command display";
    platforms = stdenv.lib.platforms.linux;
  };
}
