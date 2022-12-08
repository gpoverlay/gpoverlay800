# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dune

DESCRIPTION="Syntax extension for writing in-line tests in ocaml code"
HOMEPAGE="https://github.com/janestreet/ppx_inline_test"
SRC_URI="https://github.com/janestreet/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
IUSE="+ocamlopt"

DEPEND="dev-ml/time_now:${SLOT}"
RDEPEND="${DEPEND}"
# https://bugs.gentoo.org/749291#c2
RESTRICT=test