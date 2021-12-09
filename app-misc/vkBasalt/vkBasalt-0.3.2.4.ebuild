# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8
PYTHON_COMPAT=( python3_{6..9} )

inherit meson distutils-r1 multilib-minimal flag-o-matic
 
DESCRIPTION="vkBasalt"
HOMEPAGE="https://github.com/DadSchoorse/vkBasalt/"
SRC_URI="https://github.com/DadSchoorse/vkBasalt/releases/download/v0.3.2.4/vkBasalt-0.3.2.4.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
 
DEPEND="
	dev-util/glslang
	>=dev-util/vulkan-headers-1.2
	media-libs/vulkan-loader
	dev-util/spirv-headers
	media-libs/libglvnd"
RDEPEND="${DEPEND}"
BDEPEND=""
src_unpack() {
	default
}
src_prepare() {
	eapply_user
}
src_configure() {
	meson_src_configure
}
src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
