# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/gtkspell-python/gtkspell-python-2.25.3-r1.ebuild,v 1.1 2014/05/26 17:50:00 mgorny Exp $

EAPI="5"

GNOME_ORG_MODULE="gnome-python-extras"
PYTHON_COMPAT=( python2_7 )

inherit autotools eutils gnome-python-common-r1

DESCRIPTION="GtkSpell bindings for Python"
# The LICENSE with gtkspell-3 is LGPL and there is no way to express this in
# an ebuild, currently. Punt till we actually have to face the issue.
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="doc examples"

RDEPEND="app-text/gtkspell:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	gnome-base/gnome-common"
# eautoreconf needs gnome-base/gnome-common

EXAMPLES=( examples/gtkspell/. )

src_prepare() {
	epatch "${FILESDIR}/${P}-python-libs.patch" #344231
	sed -e "s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" -i configure.ac || die
	eautoreconf
	gnome-python-common-r1_src_prepare
}
