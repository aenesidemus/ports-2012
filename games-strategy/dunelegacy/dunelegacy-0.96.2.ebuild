# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-strategy/dunelegacy/dunelegacy-0.96.2.ebuild,v 1.1 2012/08/09 20:44:51 hasufell Exp $

EAPI=4
inherit autotools eutils gnome2-utils games

DESCRIPTION="Updated clone of Westood Studios' Dune2"
HOMEPAGE="http://dunelegacy.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# exits on start without libsdl[alsa]
RDEPEND="media-libs/libsdl[X,alsa,audio,video]
	media-libs/sdl-mixer[midi,mp3,vorbis]"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch "${FILESDIR}"/${P}-build.patch
	eautoreconf
}

src_install() {
	default

	doicon -s scalable ${PN}.svg
	doicon -s 48 ${PN}.png
	make_desktop_entry ${PN} "Dune Legacy"

	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	games_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}