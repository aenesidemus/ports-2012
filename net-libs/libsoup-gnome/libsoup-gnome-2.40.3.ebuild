# Distributed under the terms of the GNU General Public License v2

EAPI="5"
GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

MY_PN=${PN/-gnome}
MY_P=${MY_PN}-${PV}

inherit autotools eutils gnome2

DESCRIPTION="GNOME plugin for libsoup"
HOMEPAGE="http://live.gnome.org/LibSoup"
SRC_URI="${SRC_URI//-gnome}"

LICENSE="LGPL-2+"
SLOT="2.4"
IUSE="debug +introspection"
KEYWORDS="*"

RDEPEND="~net-libs/libsoup-${PV}[introspection?]
	|| ( gnome-base/libgnome-keyring <gnome-base/gnome-keyring-2.29.4 )
	dev-db/sqlite:3=
	introspection? ( >=dev-libs/gobject-introspection-0.9.5 )
	!>=net-libs/libsoup-2.42
"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.10
	>=dev-util/intltool-0.35
	sys-devel/gettext
	virtual/pkgconfig
"

S=${WORKDIR}/${MY_P}

src_prepare() {
	# Use lib present on the system
	epatch "${FILESDIR}"/${PN}-2.40.2-system-lib.patch
	eautoreconf
	gnome2_src_prepare
}

src_configure() {
	# FIXME: we need addpredict to workaround bug #324779 until
	# root cause (bug #249496) is solved
	addpredict /usr/share/snmp/mibs/.index

	# Disable apache tests until they are usable on Gentoo, bug #326957
	gnome2_src_configure \
		--disable-static \
		--disable-tls-check \
		$(use_enable introspection) \
		--with-libsoup-system \
		--with-gnome \
		--without-apache-httpd
}
