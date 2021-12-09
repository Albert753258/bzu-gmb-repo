# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8
PYTHON_COMPAT=( python2_7 )

inherit python-any-r1

DESCRIPTION="PlayOnLinux allows you to install and use non-native applications on your favorite operating system."
HOMEPAGE="https://github.com/PlayOnLinux/POL-POM-4"
#SRC_URI="https://github.com/PlayOnLinux/POL-POM-4/archive/refs/tags/4.4.tar.gz"
SRC_URI="http://repository.playonlinux.com/PlayOnLinux/4.4/PlayOnLinux_4.4.tar.gz"
 
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
S="${WORKDIR}"/playonlinux



DEPEND="dev-python/wxpython
        dev-python/natsort"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
        default
        sed -i -e 's/python2/python3/' Makefile
}
