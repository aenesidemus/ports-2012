# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-mobilephone/obexd/obexd-0.47.ebuild,v 1.1 2012/08/21 12:49:02 pacho Exp $

EAPI="4"

DESCRIPTION="OBEX Server and Client"
HOMEPAGE="http://www.bluez.org/"
SRC_URI="mirror://kernel/linux/bluetooth/${P}.tar.xz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE="-eds nokia -server usb"

DOCS="AUTHORS ChangeLog README doc/*.txt"

RDEPEND="eds? ( gnome-extra/evolution-data-server )
	!eds? ( dev-libs/libical )
	>=net-wireless/bluez-4.99
	>=dev-libs/openobex-1.4
	>=dev-libs/glib-2.28:2
	>=sys-apps/dbus-1.4
	server? ( !app-mobilephone/obex-data-server )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	app-arch/xz-utils"

src_configure() {
	econf \
		--disable-debug \
		--disable-silent-rules \
		$(use_with eds phonebook ebook) \
		$(use_enable nokia pcsuite) \
		$(use_enable server) \
		$(use_enable usb)
}