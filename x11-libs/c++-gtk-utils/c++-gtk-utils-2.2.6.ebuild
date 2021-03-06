# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/c++-gtk-utils/c++-gtk-utils-2.2.6.ebuild,v 1.1 2014/05/12 16:56:27 jer Exp $

EAPI=5
inherit eutils

DESCRIPTION="A library containing a number of classes and functions for programming GTK+ programs using C++"
HOMEPAGE="http://cxx-gtk-utils.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/++/xx}/${P}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="+gtk nls static-libs"
SLOT="0"

RDEPEND="
	>=dev-libs/glib-2.26
	gtk? ( x11-libs/gtk+:3 )
"
DEPEND="
	${RDEPEND}
	nls? ( sys-devel/gettext )
	virtual/pkgconfig
"

DOCS=( ChangeLog )

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_with gtk) \
		$(use_enable static-libs static) \
		--docdir=/usr/share/doc/${PF} \
		--htmldir=/usr/share/doc/${PF}/html
}

src_install() {
	default
	prune_libtool_files
}
