# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
GNOME2_LA_PUNT="yes"
GCONF_DEBUG="yes"
PYTHON_COMPAT=( python2_{6,7} )

inherit mate python-r1

DESCRIPTION="Unicode character map viewer"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="cjk +introspection test"

RDEPEND=">=dev-libs/glib-2.16.3
	>=x11-libs/pango-1.2.1
	x11-libs/gtk+:2
	introspection? ( >=dev-libs/gobject-introspection-0.6 )"
DEPEND="${RDEPEND}
	app-text/scrollkeeper
	virtual/pkgconfig
	>=dev-util/intltool-0.40
	>=app-text/mate-doc-utils-1.2.1
	test? ( ~app-text/docbook-xml-dtd-4.1.2 )"

src_prepare() {
	# Fix test
	sed -i 's/gucharmap/mucharmap/g' po/POTFILES.in || die

	# Tarball has no proper build system, should be fixed on next release.
	mate_gen_build_system

	gnome2_src_prepare
}

src_configure() {
	DOCS="ChangeLog NEWS README TODO"

	gnome2_src_configure \
		--with-gtk=2.0 \
		--disable-python-bindings \
		$(use_enable introspection) \
		$(use_enable cjk unihan)
}
