# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/milksets/milksets-0.1.3-r1.ebuild,v 1.2 2014/03/31 21:04:34 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} pypy pypy2_0 )

inherit distutils-r1

DESCRIPTION="Datasets in a common Pythonic interface to use with milk"
HOMEPAGE="http://luispedro.org/software/milksets"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"

KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""
