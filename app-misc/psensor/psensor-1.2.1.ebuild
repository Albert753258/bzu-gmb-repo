# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=8
 
DESCRIPTION="Psensors is graphical hardware temperature monitor for Linux"
HOMEPAGE="https://gitlab.com/jeanfi/psensor/"
SRC_URI="http://wpitchoune.net/psensor/files/psensor-1.2.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
 
DEPEND="
	sys-apps/lm-sensors"
RDEPEND="${DEPEND}"
BDEPEND=""
src_configure() {
	default
	eapply -p1 "${FILESDIR}/disable_werror.patch"
}
pkg_postinst()
{
   glib-compile-schemas /usr/share/glib-2.0/schemas/
}
