# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/oslo-sphinx/oslo-sphinx-1.0-r1.ebuild,v 1.2 2014/03/30 09:30:06 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Theme and extension support for Sphinx documentation from the OpenStack project."
HOMEPAGE="https://pypi.python.org/pypi/oslo.config"
SRC_URI="mirror://pypi/${PN:0:1}/oslo.sphinx/oslo.sphinx-${PV}.tar.gz"
S="${WORKDIR}/oslo.sphinx-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/pbr-0.5[${PYTHON_USEDEP}]
		<dev-python/pbr-0.6[${PYTHON_USEDEP}]
		>=dev-python/d2to1-0.2.10[${PYTHON_USEDEP}]
		<dev-python/d2to1-0.3[${PYTHON_USEDEP}]
	test? ( >=dev-python/hacking-0.5.6[${PYTHON_USEDEP}]
		<dev-python/hacking-0.8[${PYTHON_USEDEP}]
		~dev-python/pep8-1.4.5[${PYTHON_USEDEP}]
		~dev-python/pyflakes-0.7.2[${PYTHON_USEDEP}]
		~dev-python/flake8-2.0[${PYTHON_USEDEP}] )"
RDEPEND=""

python_test() {
	flake8 oslo || die "run by flake8 over folder oslo drew error"
}
