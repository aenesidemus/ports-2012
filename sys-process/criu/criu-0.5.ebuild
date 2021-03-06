# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-process/criu/criu-0.5.ebuild,v 1.2 2013/06/08 21:09:10 radhermit Exp $

EAPI=5

inherit eutils toolchain-funcs linux-info

DESCRIPTION="utility to checkpoint/restore a process tree"
HOMEPAGE="http://criu.org/"
SRC_URI="http://download.openvz.org/criu/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/protobuf-c"
DEPEND="${RDEPEND}
	app-text/asciidoc
	app-text/xmlto"

CONFIG_CHECK="~CHECKPOINT_RESTORE ~FHANDLE ~EVENTFD ~EPOLL ~INOTIFY_USER
	~UNIX_DIAG ~INET_DIAG ~PACKET_DIAG"

RESTRICT="test"

src_prepare() {
	epatch "${FILESDIR}"/crtools-0.4-flags.patch
}

src_compile() {
	unset ARCH
	emake CC="$(tc-getCC)" V=1 WERROR=0 all docs
}

src_test() {
	# root privileges are required to dump all necessary info
	if [[ ${EUID} -eq 0 ]] ; then
		emake -j1 CC="$(tc-getCC)" V=1 WERROR=0 test
	fi
}

src_install() {
	dobin ${PN}
	dodoc CREDITS README
	newman Documentation/crtools.1 ${PN}.1
}
