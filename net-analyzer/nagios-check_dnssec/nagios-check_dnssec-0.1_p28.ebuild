# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nagios-check_dnssec/nagios-check_dnssec-0.1_p28.ebuild,v 1.2 2012/08/19 20:25:39 flameeyes Exp $

EAPI=4

inherit eutils autotools
DESCRIPTION="check_dnssec is a set of Nagios plugins to monitor DNSSEC services."
HOMEPAGE="https://svn.durchmesser.ch/trac/check_dnssec"

MY_P=${P/nagios-/}

# No upstream tarballs, tagged releaess in SVN only.
SRC_URI="mirror://gentoo/${MY_P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-analyzer/nagios-plugins
		net-libs/ldns"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	eautoreconf
}

DOCS=( ChangeLog README AUTHORS )
