# Distributed under the terms of the GNU General Public License v2

EAPI="5"
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 virtualx

DESCRIPTION="A text widget implementing syntax highlighting and other features"
HOMEPAGE="http://projects.gnome.org/gtksourceview/"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="3.0"
IUSE="glade +introspection"
KEYWORDS="*"

# Note: has native OSX support, prefix teams, attack!
RDEPEND="
	>=x11-libs/gtk+-3.4:3[introspection?]
	>=dev-libs/libxml2-2.6:2
	>=dev-libs/glib-2.32:2
	glade? ( >=dev-util/glade-3.9:3.10 )
	introspection? ( >=dev-libs/gobject-introspection-0.9.0 )
"
DEPEND="${RDEPEND}
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.50
	>=sys-devel/gettext-0.17
	virtual/pkgconfig
"

src_prepare() {
	gnome2_src_prepare

	sed -i -e 's:--warn-all::' gtksourceview/Makefile.in || die

	# Skip broken test until upstream bug #621383 is solved
	sed -e "/guess-language/d" \
		-e "/get-language/d" \
		-i tests/test-languagemanager.c || die
}

src_configure() {
	gnome2_src_configure \
		--disable-deprecations \
		--enable-providers \
		$(use_enable glade glade-catalog) \
		$(use_enable introspection)
}

src_test() {
	Xemake check
}

src_install() {
	DOCS="AUTHORS ChangeLog HACKING MAINTAINERS NEWS README"
	gnome2_src_install

	insinto /usr/share/${PN}-3.0/language-specs
	doins "${FILESDIR}"/2.0/gentoo.lang
}
