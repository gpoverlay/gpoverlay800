# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby26 ruby27"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="gh.gemspec"

inherit ruby-fakegem

DESCRIPTION="multi-layer client for the github api v3"
HOMEPAGE="https://github.com/travis-ci/gh"
SRC_URI="https://github.com/travis-ci/gh/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "
	dev-ruby/webmock
"

ruby_add_rdepend "
	|| ( dev-ruby/activesupport:6.0 dev-ruby/activesupport:5.2 )
	>=dev-ruby/addressable-2.4.0:0
	dev-ruby/faraday:1
	dev-ruby/faraday_middleware:1
	>dev-ruby/multi_json-1.0
	dev-ruby/net-http-pipeline
	>=dev-ruby/net-http-persistent-2.9:*
"

all_ruby_prepare() {
	sed -i \
		-e '/net-http-persistent/ s/~> 2.9/>= 2.9/' \
		-e "/activesupport/ s/'~> 5.0'/'>= 5', '< 6.1'/" \
		-e 's/git ls-files/find/' \
		"${RUBY_FAKEGEM_GEMSPEC}" || die
}
