# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/opencl/opencl-0-r4.ebuild,v 1.5 2014/04/06 10:10:54 ago Exp $

EAPI=5

inherit multilib-build

DESCRIPTION="Virtual for OpenCL implementations"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
CARDS=( fglrx nvidia )
IUSE="${CARDS[@]/#/video_cards_}"

DEPEND=""
# intel-ocl-sdk is amd64-only
RDEPEND="app-admin/eselect-opencl
	|| (
		media-libs/mesa[opencl,${MULTILIB_USEDEP}]
		video_cards_fglrx? (
			>=x11-drivers/ati-drivers-12.1-r1 )
		video_cards_nvidia? (
			>=x11-drivers/nvidia-drivers-290.10-r2 )
		abi_x86_64? ( !abi_x86_32? ( dev-util/intel-ocl-sdk ) )
	)"
