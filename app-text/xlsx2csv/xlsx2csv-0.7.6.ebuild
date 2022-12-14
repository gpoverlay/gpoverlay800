# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="xml(+)"
DISTUTILS_USE_SETUPTOOLS=no

inherit distutils-r1

DESCRIPTION="Convert MS Office xlsx files to CSV"
HOMEPAGE="https://github.com/dilshod/xlsx2csv/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="dev-lang/perl"

PATCHES=( "${FILESDIR}"/${P}-tests.patch )

python_compile_all() {
	emake -C man
}

python_test() {
	"${EPYTHON}" test/run || die "tests failed with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
	doman man/${PN}.1
}
