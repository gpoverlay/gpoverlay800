# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Perl package for Tcl"
HOMEPAGE="http://jfontain.free.fr/tclperl.htm"
SRC_URI="http://jfontain.free.fr/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""

DEPEND="
	>=dev-lang/tcl-8.3.3:=
	>=dev-lang/perl-5.6.0:=
	sys-libs/binutils-libs:="
RDEPEND="${DEPEND}"

DOCS=( CHANGES README)
HTML_DOCS=( tclperl.htm )

src_compile() {
	append-flags -fPIC

	# ./build.sh
	perl Makefile.PL || die
	emake OPTIMIZE="${CFLAGS}" Tcl.o

	$(tc-getCC) -shared ${LDFLAGS} ${CFLAGS} -o tclperl.so.${PV} -DUSE_TCL_STUBS \
		tclperl.c tclthread.c `perl -MExtUtils::Embed -e ccopts -e ldopts` \
		/usr/$(get_libdir)/libtclstub`echo 'puts $tcl_version' | tclsh`.a Tcl.o || die
}

src_install() {
	exeinto /usr/$(get_libdir)/${P}
	doexe tclperl.so.${PV}
	doexe pkgIndex.tcl
	einstalldocs
}
