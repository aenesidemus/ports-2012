# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/exiftool/exiftool-9.61.ebuild,v 1.1 2014/05/23 19:37:33 radhermit Exp $

EAPI=5

MY_PN=Image-ExifTool
MY_P=${MY_PN}-${PV}
inherit perl-module

DESCRIPTION="Read and write meta information in image, audio and video files"
HOMEPAGE="http://www.sno.phy.queensu.ca/~phil/exiftool/ ${HOMEPAGE}"
SRC_URI="http://www.sno.phy.queensu.ca/~phil/exiftool/${MY_P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x64-macos"

SRC_TEST="do"

src_install() {
	perl-module_src_install
	dohtml -r html/
}
