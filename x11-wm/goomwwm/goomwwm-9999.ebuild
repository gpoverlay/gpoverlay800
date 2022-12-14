# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic git-r3 toolchain-funcs

DESCRIPTION="Get out of my way, Window Manager!"
HOMEPAGE="https://github.com/seanpringle/goomwwm"
EGIT_REPO_URI="https://github.com/seanpringle/goomwwm"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="
	x11-libs/libXft
	x11-libs/libX11
	x11-libs/libXinerama
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-base/xorg-proto
"

src_prepare() {
	default
	sed -i -e 's|$(LDADD) $(LDFLAGS)|$(LDFLAGS) $(LDADD)|g' Makefile || die
}

src_configure() {
	use debug && append-cflags -DDEBUG
}

src_compile() {
	emake CC="$(tc-getCC)" proto normal
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
}
