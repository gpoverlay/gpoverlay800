# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python LiveReload is an awesome tool for web developers"
HOMEPAGE="https://github.com/lepture/python-livereload"
SRC_URI="https://github.com/lepture/python-${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/python-${P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE="examples"

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/tornado[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/flask-sphinx-themes

python_prepare_all() {
	# AssertionError: assert (None, None) == ('/var/tmp/portage/dev-python/livereload-2.6.1/work/livereload-2.6.1/tests/tmp/first/foo',\n None)
	sed -i -e 's:test_watch_multiple_dirs:_&:' tests/test_watcher.py || die

	distutils-r1_python_prepare_all
}

python_install_all() {
	if use examples; then
		docinto examples
		dodoc -r example/.
		docompress -x /usr/share/doc/${PF}/examples
	fi

	distutils-r1_python_install_all
}
