# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/fwlogwatch/fwlogwatch-1.4.ebuild,v 1.1 2013/06/03 20:15:56 jer Exp $

EAPI=5

inherit eutils flag-o-matic toolchain-funcs

DESCRIPTION="A packet filter and firewall log analyzer"
HOMEPAGE="http://fwlogwatch.inside-security.de/"
SRC_URI="${HOMEPAGE}sw/${P}.tar.bz2"

KEYWORDS="~amd64 ~ppc ~sparc ~x86"
LICENSE="GPL-1"
SLOT="0"
IUSE="adns nls zlib"

RDEPEND="
	adns? ( net-libs/adns )
	zlib? ( sys-libs/zlib )
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	nls? ( sys-devel/gettext )
"

src_prepare() {
	if use nls; then
		strip-linguas -i po/
		local lingua pofile
		for pofile in po/*.po; do
			lingua=${pofile/po\/}
			lingua=${lingua/.po}
			if ! has ${lingua} ${LINGUAS}; then
				sed -i \
					-e "/${lingua}.[mp]o/d" \
					Makefile po/Makefile || die
			fi
		done
	fi

	sed -i \
		-e '/^INSTALL_/s|$| -D|g' \
		-e 's|make|$(MAKE)|g ' \
		Makefile || die
}

src_configure() {
	if use adns; then
		sed -i Makefile -e '/^LIBS/ s|#-ladns |-ladns #|g' || die
		append-cflags -DHAVE_ADNS
	fi
	if ! use zlib; then
		sed -i Makefile -e '/^LIBS/ s|-lz||g' || die
	else
		append-cflags -DHAVE_ZLIB
	fi

	use nls && append-cflags -DHAVE_GETTEXT
}

src_compile() {
	emake \
		CC=$(tc-getCC) \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}"
	use nls && emake -C po
}

src_install() {
	emake \
		LOCALE_DIR="${D}/usr" INSTALL_DIR="${D}/usr" \
		install
	use nls && emake \
		LOCALE_DIR="${D}/usr" INSTALL_DIR="${D}/usr" \
		install-i18n

	dosbin contrib/fwlw_notify
	dosbin contrib/fwlw_respond

	dodoc AUTHORS ChangeLog CREDITS README

	insinto /usr/share/fwlogwatch/contrib

	doins contrib/fwlogsummary.cgi
	doins contrib/fwlogsummary_small.cgi
	doins contrib/fwlogwatch.php

	insinto /etc
	doins fwlogwatch.config
}
