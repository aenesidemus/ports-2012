# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/geopy/geopy-0.96.2.ebuild,v 1.2 2014/03/31 21:00:15 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )

inherit distutils-r1

DESCRIPTION="A Geocoding Toolbox for Python"
HOMEPAGE="http://www.geopy.org/ http://pypi.python.org/pypi/geopy http://code.google.com/p/geopy/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
IUSE="test"

RDEPEND="<=dev-python/beautifulsoup-4.0[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

python_test() {
	nosetests || die "Tests failed under ${EPYTHON}"
}
