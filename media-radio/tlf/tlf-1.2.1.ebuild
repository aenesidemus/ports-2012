# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-radio/tlf/tlf-1.2.1.ebuild,v 1.1 2014/05/16 04:52:35 tomjbe Exp $

EAPI="5"

inherit flag-o-matic multilib

DESCRIPTION="Console-mode amateur radio contest logger"
HOMEPAGE="http://home.iae.nl/users/reinc/TLF-0.2.html"
SRC_URI="http://www.hs-mittweida.de/tb/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/ncurses
	dev-libs/glib:2
	media-libs/hamlib
	media-sound/sox"
DEPEND="${RDEPEND}"

src_configure() {
	append-ldflags -L/usr/$(get_libdir)/hamlib
	econf --docdir=/usr/share/doc/${PF} --enable-hamlib
}
