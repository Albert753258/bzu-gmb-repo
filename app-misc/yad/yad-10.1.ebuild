# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8
 
DESCRIPTION="Yad library"
HOMEPAGE="https://github.com/v1cont/yad"
SRC_URI="https://github.com/v1cont/yad/releases/download/v10.1/yad-10.1.tar.xz"
 
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
 
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
src_install() {
	emake DESTDIR="${D}" install
}
