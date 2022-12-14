# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Microsoft Works file word processor format import filter library"
HOMEPAGE="https://sourceforge.net/p/libwps/wiki/Home/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz"

LICENSE="|| ( LGPL-2.1 MPL-2.0 )"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm arm64 ~loong ~ppc64 ~riscv x86"
IUSE="debug doc tools"

BDEPEND="
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"
DEPEND="
	dev-libs/librevenge
"
RDEPEND="${DEPEND}"

src_configure() {
	local myeconfargs=(
		--disable-static
		$(use_enable debug)
		$(use_with doc docs)
		$(use_enable tools)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default
	find "${D}" -name '*.la' -type f -delete || die
}
