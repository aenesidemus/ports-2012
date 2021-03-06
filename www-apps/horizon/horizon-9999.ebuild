# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/horizon/horizon-9999.ebuild,v 1.7 2014/03/27 22:06:50 prometheanfire Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-2

DESCRIPTION="Horizon is a Django-based project aimed at providing a complete
OpenStack Dashboard."
HOMEPAGE="https://launchpad.net/horizon"
EGIT_REPO_URI="https://github.com/openstack/horizon.git"
EGIT_BRANCH="master"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/d2to1-0.2.10[${PYTHON_USEDEP}]
		<dev-python/d2to1-0.3[${PYTHON_USEDEP}]
		>=dev-python/pbr-0.5[${PYTHON_USEDEP}]
		<dev-python/pbr-0.6[${PYTHON_USEDEP}]
		>=dev-python/django-1.5[${PYTHON_USEDEP}]
		<dev-python/django-1.6[${PYTHON_USEDEP}]
		dev-python/django-compressor[${PYTHON_USEDEP}]
		>=dev-python/django-openstack-auth-1.0.8[${PYTHON_USEDEP}]
		>=dev-python/iso8601-0.1.4[${PYTHON_USEDEP}]
		dev-python/netaddr[${PYTHON_USEDEP}]
		>=dev-python/python-cinderclient-1.0.2[${PYTHON_USEDEP}]
		<dev-python/python-cinderclient-2.0.0[${PYTHON_USEDEP}]
		<dev-python/python-glanceclient-2[${PYTHON_USEDEP}]
		>=dev-python/python-heatclient-0.2.2[${PYTHON_USEDEP}]
		>=dev-python/python-keystoneclient-0.6.0[${PYTHON_USEDEP}]
		>=dev-python/python-novaclient-2.12.0[${PYTHON_USEDEP}]
		<dev-python/python-novaclient-3[${PYTHON_USEDEP}]
		>=dev-python/python-neutronclient-2.2.0[${PYTHON_USEDEP}]
		<dev-python/python-neutronclient-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-swiftclient-1.1[${PYTHON_USEDEP}]
		<dev-python/python-swiftclient-2[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/lockfile[${PYTHON_USEDEP}]"
