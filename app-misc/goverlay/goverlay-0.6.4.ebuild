# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8

inherit qmake-utils


DESCRIPTION="Goverlay"
HOMEPAGE="https://github.com/benjamimgois/goverlay/"
SRC_URI="https://github.com/benjamimgois/goverlay/archive/refs/tags/0.6.4.tar.gz"
 
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
 
DEPEND="dev-lang/lazarus"
RDEPEND="${DEPEND}"
BDEPEND=""
src_prepare() {
	default
	cp -r /usr/share/lazarus "${WORKDIR}/lazarus"
}
src_compile() {

	lazbuild --lazarusdir="${WORKDIR}/lazarus" --build-all "${PN}.lpi"
}

src_install() {
	dobin "${PN}"
	domenu "${S}/data/io.github.benjamimgois.${PN}.desktop"
	insinto "/usr/share/metainfo"
	doins "${S}/data/io.github.benjamimgois.${PN}.metainfo.xml"

	for icon_size in 128 256 512; do
		doicon --size ${icon_size} "${S}/data/icons/${icon_size}x${icon_size}/${PN}.png"
	done
}

