# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Colored, side-by-side diff terminal viewer (ex. cdiff)"
HOMEPAGE="https://github.com/ymattw/ydiff"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="sys-apps/less"

DOCS=( CHANGES.rst README.rst )

RESTRICT="test"

python_test() {
	${PYTHON} tests/test_ydiff.py || die "Unit tests failed."

	./tests/regression.sh || die "Regression tests failed."
}
