# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Qt5 cbindings"
HOMEPAGE="https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt5/cbindings"
SRC_URI="https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/main/lazarus-main.tar?path=lcl/interfaces/qt5/cbindings -> ${P}.tar"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}"/lazarus-main-lcl-interfaces-qt5-cbindings/lcl/interfaces/qt5/cbindings

src_unpack() {
	#mv "${DISTDIR}/lasarus-main-lcl-interfaces-qt5-cbindings.tar" "${DISTDIR}/qt5pas-2.6-r1"
	#mv "${WORKDIR}/${LAZ_UNPACKED_DIR}/${LAZ_DIRECTORY}" "${WORKDIR}/${P}"
	default
	whoami
}
src_install() {
	INSTALL_ROOT="${D}" default
}
src_configure() {
	eqmake5
}
