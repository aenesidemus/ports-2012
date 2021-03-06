# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/freeglut/freeglut-2.8.1-r1.ebuild,v 1.9 2014/04/19 17:47:00 ago Exp $

EAPI=5
inherit autotools-multilib

DESCRIPTION="A completely OpenSourced alternative to the OpenGL Utility Toolkit (GLUT) library"
HOMEPAGE="http://freeglut.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="debug static-libs"

RDEPEND="virtual/glu[${MULTILIB_USEDEP}]
	virtual/opengl[${MULTILIB_USEDEP}]
	x11-libs/libX11[${MULTILIB_USEDEP}]
	x11-libs/libXext[${MULTILIB_USEDEP}]
	>=x11-libs/libXi-1.3[${MULTILIB_USEDEP}]
	x11-libs/libXrandr[${MULTILIB_USEDEP}]
	x11-libs/libXxf86vm[${MULTILIB_USEDEP}]
	abi_x86_32? ( !app-emulation/emul-linux-x86-opengl[-abi_x86_32(-)] )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	x11-proto/inputproto[${MULTILIB_USEDEP}]
	x11-proto/xproto[${MULTILIB_USEDEP}]"

PATCHES=(
	# Please read the comments in the patch before thinking about dropping it
	# yet again...
	"${FILESDIR}"/${PN}-2.4.0-bsd-usb-joystick.patch
)

HTML_DOCS=( doc/. )
