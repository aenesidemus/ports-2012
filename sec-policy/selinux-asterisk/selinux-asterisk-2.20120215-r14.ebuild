# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-asterisk/selinux-asterisk-2.20120215-r14.ebuild,v 1.2 2012/07/30 16:25:56 swift Exp $
EAPI="4"

IUSE=""
MODS="asterisk"
BASEPOL="2.20120215-r14"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for asterisk"

KEYWORDS="amd64 x86"