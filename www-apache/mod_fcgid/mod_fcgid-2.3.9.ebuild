# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apache/mod_fcgid/mod_fcgid-2.3.9.ebuild,v 1.4 2014/01/17 20:46:57 ago Exp $

inherit apache-module eutils multilib

DESCRIPTION="mod_fcgid is a binary-compatible alternative to mod_fastcgi with better process management."
HOMEPAGE="http://httpd.apache.org/mod_fcgid/"
SRC_URI="mirror://apache/httpd/mod_fcgid/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc ~ppc64 x86"
IUSE=""

APACHE2_MOD_CONF="2.2/20_${PN}"
APACHE2_MOD_DEFINE="FCGID"

DOCFILES="CHANGES-FCGID README-FCGID STATUS-FCGID"

need_apache2

src_compile () {
	./configure.apxs || die "apxs configure failed!"
	make || die "make failed"
	ln -sf modules/fcgid/.libs .libs || die "symlink creation failed"
}
