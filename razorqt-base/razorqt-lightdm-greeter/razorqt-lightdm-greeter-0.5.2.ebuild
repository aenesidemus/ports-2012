# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/razorqt-base/razorqt-lightdm-greeter/razorqt-lightdm-greeter-0.5.2.ebuild,v 1.3 2013/04/05 14:40:48 ago Exp $

EAPI=4
inherit cmake-utils

DESCRIPTION="Razor-qt LightDM greeter"
HOMEPAGE="http://razor-qt.org/"

if [[ ${PV} = *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/Razor-qt/razor-qt.git"
	EGIT_BRANCH="master"
	KEYWORDS=""
else
	SRC_URI="http://www.razor-qt.org/downloads/files/razorqt-${PV}.tar.bz2"
	KEYWORDS="amd64 ~ppc x86"
	S="${WORKDIR}/razorqt-${PV}"
fi

LICENSE="LGPL-2.1+"
SLOT="0"
IUSE=""

DEPEND="razorqt-base/razorqt-libs
	x11-misc/lightdm[qt4]"
RDEPEND="${DEPEND}
	razorqt-base/razorqt-data
	razorqt-base/razorqt-power
	!x11-misc/lightdm-razorqt-greeter"

src_configure() {
	local mycmakeargs=(
		-DSPLIT_BUILD=On
		-DMODULE_LIGHTDM=On
	)
	cmake-utils_src_configure
}
