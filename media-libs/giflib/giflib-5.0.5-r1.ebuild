# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/giflib/giflib-5.0.5-r1.ebuild,v 1.2 2014/04/18 14:32:11 hasufell Exp $

EAPI=5

inherit eutils libtool autotools-multilib

DESCRIPTION="Library to handle, display and manipulate GIF images"
HOMEPAGE="http://sourceforge.net/projects/giflib/"
SRC_URI="mirror://sourceforge/giflib/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
# Needs testing first.
#KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="static-libs"

RDEPEND="
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20140406-r1
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32]
	)"
DEPEND="${RDEPEND}"

src_prepare() {
	elibtoolize
}

src_configure() {
	local myconfargs=(
		$(use_enable static-libs static)
		)
	# No need for xmlto as they ship generated files.
	ac_cv_prog_have_xmlto=no \
		autotools-multilib_src_configure

}

src_install() {
	autotools-multilib_src_install

	# for static libs the .la file is required if built with +X
	use static-libs || prune_libtool_files --all

	doman doc/*.1
	dodoc doc/*.txt
	dohtml -r doc
}
