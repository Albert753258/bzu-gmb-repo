# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8

#inherit cmake
inherit cmake
 
DESCRIPTION="CPU-X is a Free software that gathers information on CPU, motherboard and more"
HOMEPAGE="https://github.com/X0rg/CPU-X"
SRC_URI="https://github.com/X0rg/CPU-X/archive/refs/tags/v4.2.0.zip"
 
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
S="${WORKDIR}"/CPU-X-4.2.0
IUSE_VIDEO_CARDS="
	video_cards_amdgpu
	video_cards_nvidia"
IUSE="${IUSE_VIDEO_CARDS}"
 
DEPEND="sys-libs/ncurses
	>app-misc/libcpuid-0.5.0
	sys-apps/pciutils
	>media-libs/glfw-3.3
	sys-process/procps
	video_cards_amdgpu? ( dev-libs/amdgpu-pro-opencl )
	video_cards_nvidia? ( dev-util/nvidia-cuda-toolkit )"
RDEPEND="${DEPEND}"
BDEPEND=""
src_prepare() {
	cmake_src_prepare
}


src_configure() {
	local mycmakeargs=(
		-DGSETTINGS_COMPILE=OFF
		-DWITH_LIBSTATGRAB=OFF
	)

	cmake_src_configure
}

pkg_preinst() {
	gnome2_schemas_update
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_icon_cache_update
}
