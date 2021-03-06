# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/sflowtool/sflowtool-3.30.ebuild,v 1.1 2013/11/08 14:48:38 jer Exp $

EAPI=4
inherit eutils flag-o-matic

DESCRIPTION="sflowtool is a utility for collecting and processing sFlow data"
HOMEPAGE="http://www.inmon.com/technology/sflowTools.php"
SRC_URI="http://www.inmon.com/bin/${P}.tar.gz"

LICENSE="inmon-sflow"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="debug"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.20-ctype-header.patch
	append-cppflags -DSPOOFSOURCE
	use debug && append-cppflags -DDEBUG
}
