# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="GNOME Translation Editor"
HOMEPAGE="https://wiki.gnome.org/Apps/Gtranslator"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="gtk-doc"

DEPEND="
	>=dev-libs/glib-2.71.3:2
	>=x11-libs/gtk+-3.22.20:3
	>=gui-libs/libhandy-1.5.0:1
	gnome-extra/libgda:5=
	gnome-base/gsettings-desktop-schemas
	>=app-text/gspell-1.2.0:=
	>=x11-libs/gtksourceview-4.0.2:4
	>=dev-libs/libxml2-2.4.12:2
	net-libs/libsoup:3.0
	>=dev-libs/json-glib-1.2.0
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/appstream-glib
	dev-libs/libxml2:2
	dev-util/glib-utils
	gtk-doc? (
		>=dev-util/gtk-doc-1.28
		app-text/docbook-xml-dtd:4.1.2
	)
	dev-util/itstool
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${P}-Revert-Add-GDA-6-compatibility.patch
)

src_configure() {
	local emesonargs=(
		$(meson_use gtk-doc gtk_doc)
		-Dprofile=default
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
