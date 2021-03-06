# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/amor/amor-4.13.0.ebuild,v 1.2 2014/04/17 00:43:32 johu Exp $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE: Amusing Misuse Of Resources - desktop-dwelling creature"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="x11-libs/libX11
	x11-libs/libXext"
RDEPEND="${DEPEND}"
