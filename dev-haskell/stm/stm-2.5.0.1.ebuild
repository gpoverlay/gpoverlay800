# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Software Transactional Memory"
HOMEPAGE="https://wiki.haskell.org/Software_transactional_memory"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
# keep in sync with ghc-8.10.5
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86 ~amd64-linux ~x86-linux"

RDEPEND=">=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

# ghc-9.0.1 and ghc-9.0.2 actually bundles stm-2.5.0.0, but downgrades can be messy.
# Mark as bundled as a workaround.
CABAL_CORE_LIB_GHC_PV="8.10.6 9.0.2"