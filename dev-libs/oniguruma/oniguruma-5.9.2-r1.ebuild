# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/oniguruma/oniguruma-5.9.2-r1.ebuild,v 1.1 2012/08/17 14:41:06 naota Exp $

EAPI=4

inherit eutils autotools-utils

MY_P=onig-${PV}

DESCRIPTION="a regular expression library for different character encodings"
HOMEPAGE="http://www.geocities.jp/kosako3/oniguruma"
SRC_URI="http://www.geocities.jp/kosako3/oniguruma/archive/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="combination-explosion-check crnl-as-line-terminator static-libs"

PATCHES=( "${FILESDIR}"/${P}-makefile.patch )
DOCS=( AUTHORS HISTORY README{,.ja} doc/{API,FAQ,RE}{,.ja} )
# Needed for a sane .so versionning on fbsd, please dont drop
AUTOTOOLS_AUTORECONF=1

S=${WORKDIR}/${MY_P}

src_configure() {
	local myeconfargs=(
		$(use_enable combination-explosion-check)
		$(use_enable crnl-as-line-terminator)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	use static-libs || prune_libtool_files
}