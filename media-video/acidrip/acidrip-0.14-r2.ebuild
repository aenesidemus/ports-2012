# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/acidrip/acidrip-0.14-r2.ebuild,v 1.5 2014/03/18 15:40:16 beandog Exp $

EAPI="2"

inherit perl-app

DESCRIPTION="A gtk-perl mplayer/mencoder frontend for ripping DVDs"
HOMEPAGE="http://sourceforge.net/acidrip/"
SRC_URI="mirror://sourceforge/${P}.tar.gz"
RESTRICT="mirror"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="encode"

DEPEND="dev-lang/perl
	dev-perl/gtk2-perl
	media-video/lsdvd
	media-video/mplayer[encode]
	encode? ( >=media-sound/lame-3.92 )"

src_prepare() {
	# bug 168012
	epatch "${FILESDIR}/${PN}-mplayer.patch"
}
