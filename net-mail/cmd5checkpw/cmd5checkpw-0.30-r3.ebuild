# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit fixheadtails

MY_VER=$(ver_rs 1- "")

DESCRIPTION="A checkpassword compatible authentication program using CRAM-MD5"
SRC_URI="https://www.fehcom.de/qmail/auth/${PN}-${MY_VER}_tgz.bin -> ${P}.tar.gz"
HOMEPAGE="https://www.fehcom.de/qmail/smtpauth.html"

LICENSE="public-domain RSA"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE=""

DEPEND="acct-group/cmd5checkpw"
RDEPEND="${DEPEND}"

pkg_setup() {
	if has_version "<net-mail/cmd5checkpw-0.30"; then
		ewarn
		ewarn "this version is in NO WAY COMPATIBLE with cmd5checkpw-0.2x"
		ewarn "it actually receives the authentication credentials"
		ewarn "in a different order then the old implementation"
		ewarn "see bug #100693 for details"
		ewarn "this version IS needed by >=qmail-1.03-r16"
		ewarn
	fi
}

PATCHES=(
	"${FILESDIR}"/euid_${MY_VER}.diff
	"${FILESDIR}"/reloc.diff
)

src_prepare() {
	default

	ht_fix_file Makefile
}

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS} -o cmd5checkpw"
}

src_install() {
	insinto /etc
	insopts -m 640 -o root -g cmd5checkpw
	doins "${FILESDIR}"/poppasswd

	exeinto /usr/bin
	exeopts -o root -g cmd5checkpw -m 2755
	doexe cmd5checkpw

	doman cmd5checkpw.8
	einstalldocs
}

pkg_postinst() {
	chmod 640 "${EROOT}"/etc/poppasswd || die
	chown root:cmd5checkpw "${EROOT}"/etc/poppasswd || die
}
