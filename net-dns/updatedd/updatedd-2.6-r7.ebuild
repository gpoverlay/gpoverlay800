# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Dynamic DNS client with plugins for several dynamic dns services"
HOMEPAGE="https://savannah.nongnu.org/projects/updatedd/"
SRC_URI="https://savannah.nongnu.org/download/updatedd/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc x86"

RDEPEND="
	dev-lang/perl
	dev-perl/IO-Socket-Timeout
"

PATCHES=(
	"${FILESDIR}/${P}-options.patch"
	"${FILESDIR}/fix-ovh-DYNDNSHOST.patch"
	"${FILESDIR}/set-socket-timeouts-for-ipserv.patch"
	"${FILESDIR}/fix-ovh-support.patch"
	"${FILESDIR}/${P}-respect-docdir.patch"
)

src_prepare() {
	default

	# Needed for Clang 16
	eautoreconf
}

src_install() {
	find "${ED}" -name '*.la' -delete || die
}
