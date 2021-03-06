# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libxmi/libxmi-1.3.ebuild,v 1.9 2014/02/11 14:43:45 hattya Exp $

EAPI=5

AUTOTOOLS_AUTORECONF=true

inherit autotools-utils

DESCRIPTION="C/C++ function library for rasterizing 2-D vector graphics"
HOMEPAGE="http://www.gnu.org/software/libxmi/"
SRC_URI="http://dev.gentoo.org/~jlec/distfiles/${P}.tar.xz"
#mirror://gnu/${PN}/${P}.tar.gz"
# Version unbundled from plotutils

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="static-libs"

DEPEND="!<=media-libs/plotutils-2.6"
RDEPEND="${DEPEND}"
