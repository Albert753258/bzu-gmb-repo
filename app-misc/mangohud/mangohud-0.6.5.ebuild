# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8
PYTHON_COMPAT=( python3_{6..9} )

inherit meson distutils-r1 multilib-minimal flag-o-matic
 
DESCRIPTION="Mangohud"
HOMEPAGE="https://github.com/flightlessmango/MangoHud/"
SRC_URI="https://github.com/flightlessmango/MangoHud/releases/download/v0.6.5/MangoHud-v0.6.5-Source.tar.xz"
S="${WORKDIR}"/MangoHud-v0.6.5

LICENSE="G"
SLOT="0"
KEYWORDS="amd64"
IUSE="+dbus debug +X xnvctrl wayland video_cards_nvidia"
 
DEPEND="
	dev-util/glslang
	>=dev-util/vulkan-headers-1.2
	media-libs/vulkan-loader
	media-libs/libglvnd"
RDEPEND="${DEPEND}"
BDEPEND=""
src_unpack() {
	#mkdir ${WORKDIR}/mangohud-0.6.5
	#tar -xf ${DISTDIR}/MangoHud-v0.6.5-Source.tar.xz -C ${WORKDIR}/mangohud-0.6.5 --strip-components=1
	#echo ${DISTDIR}
	#git-r3_src_unpack
	default
}
src_prepare() {
	# Both imgui archives use the same folder name, so we don't need
	# to rename anything. Just move the folders to the appropriate location.
	#mv "${WORKDIR}/imgui-${IMGUI_VER}" "${S}/subprojects" || die

	eapply_user
}
src_configure() {
	local emesonargs=(
		-Dwith_xnvctrl=$(usex xnvctrl enabled disabled)
	)
	meson_src_configure
}
src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
src_install_all() {
	dodoc "${S}/bin/MangoHud.conf"

	einstalldocs
}
