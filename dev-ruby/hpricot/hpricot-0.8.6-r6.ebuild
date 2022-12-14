# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27 ruby30"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.md"

RUBY_FAKEGEM_EXTENSIONS=(ext/hpricot_scan/extconf.rb)

inherit ruby-fakegem

DESCRIPTION="A fast and liberal HTML parser for Ruby"
HOMEPAGE="https://wiki.github.com/hpricot/hpricot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~hppa ppc ppc64 ~riscv sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "dev-ruby/rake
	dev-ruby/rdoc
	dev-ruby/rake-compiler"

ruby_add_rdepend "dev-ruby/fast_xs"

# Probably needs the same jdk as JRuby but I'm not sure how to express
# that just yet.
DEPEND+=" dev-util/ragel"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/ s:^:#:' Rakefile || die

	# Fix encoding assumption of environment for Ruby 1.9.
	# https://github.com/hpricot/hpricot/issues/52
	# sed -i -e '1 iEncoding.default_external=Encoding::UTF_8 if RUBY_VERSION =~ /1.9/' test/load_files.rb || die

	# Avoid unneeded dependency on git.
	sed -i -e '/^REV/ s/.*/REV = "6"/' Rakefile || die

	# Fix int size warning
	sed -i -e 's/te - ts/(int)(te - ts)/' ext/hpricot_scan/hpricot_css.rl || die
}

each_ruby_prepare() {
	pushd .. &>/dev/null
	eapply "${FILESDIR}"/${P}-fast_xs.patch
	popd .. &>/dev/null
}

each_ruby_compile() {
	${RUBY} -S rake ragel || die

	each_fakegem_compile
}
