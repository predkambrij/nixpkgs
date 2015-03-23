{ stdenv, fetchurl, attr, acl, zlib, libuuid, e2fsprogs, lzo
, asciidoc, xmlto, docbook_xml_dtd_45, docbook_xsl, libxslt }:

#let version = "3.17.3"; in
let version = "3.18.2"; in

stdenv.mkDerivation rec {
  name = "btrfs-progs-${version}";

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v${version}.tar.xz";
    #sha256 = "0b5cvp8qk569r73003s2wisws6s8zlbmq9d1sdrmjlavv7w9zgg7";
    #sha256 = "b23965d7214ebc93937df658f18fefe020fc2fd2be4d591094ef1aae168a36c8";
    sha256 = "dd8ddb4d201e5ffd32a15ed0e1f33fbc2c8fb16383f1519a9fae136698c2dfec";
  };

  buildInputs = [
    attr acl zlib libuuid e2fsprogs lzo
    asciidoc xmlto docbook_xml_dtd_45 docbook_xsl libxslt
  ];

  # for btrfs to get the rpath to libgcc_s, needed for pthread_cancel to work
  NIX_CFLAGS_LINK = "-lgcc_s";

  makeFlags = "prefix=$(out)";

  meta = with stdenv.lib; {
    description = "Utilities for the btrfs filesystem";
    homepage = https://btrfs.wiki.kernel.org/;
    license = licenses.gpl2;
    maintainers = with maintainers; [ raskin wkennington ];
    platforms = platforms.linux;
  };
}
