# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
GCONF_DEBUG="yes"

inherit mate

DESCRIPTION="Tool to display MATE dialogs from the commandline and shell scripts"
HOMEPAGE="http://mate-desktop"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="libnotify"

RDEPEND="x11-libs/gtk+:2
	>=dev-libs/glib-2.8:2
	libnotify? ( >=x11-libs/libnotify-0.7.0 )"
DEPEND="${RDEPEND}
	app-text/scrollkeeper
	app-text/docbook-xml-dtd:4.1.2
	>=dev-util/intltool-0.40
	>=sys-devel/gettext-0.14
	virtual/pkgconfig
	>=app-text/mate-doc-utils-1.5.0
	>=mate-base/mate-common-1.5.0"

src_configure() {
	DOCS="AUTHORS ChangeLog HACKING NEWS README THANKS TODO"

	gnome2_src_configure \
		--with-gtk=2.0 \
		$(use_enable libnotify)
}
