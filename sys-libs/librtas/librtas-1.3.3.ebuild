# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/librtas/librtas-1.3.3.ebuild,v 1.5 2010/02/01 15:48:09 josejx Exp $

inherit eutils

DESCRIPTION=" Librtas provides a set of libraries for user-space access to RTAS on the ppc64 architecture."
SRC_URI="http://librtas.ozlabs.org/releases/librtas-${PV}.tar.gz"
HOMEPAGE="http://librtas.ozlabs.org/"

SLOT="0"
LICENSE="IBM"
KEYWORDS="ppc ppc64"
IUSE=""

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/${PN}-1.3.3-remove-doc.patch
	epatch "${FILESDIR}"/${PN}-1.3.3-open.patch
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README
}
