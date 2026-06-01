# Copyright 2026 Harry Wada
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="My personal music daemon"
HOMEPAGE="https://github.com/harrywada/music"
SRC_URI="https://github.com/harrywada/music/archive/refs/tags/${PV}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mpris systemd"

RDEPEND="
	media-libs/alsa-lib
	mpris? (
		systemd? ( sys-apps/systemd )
		!systemd? ( sys-auth/elogind )
	)
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_install() {
	emake MPRIS=$(usex mpris 1 0) SDBUS=$(usex systemd systemd elogind) DESTDIR="${ED}" install

	exeinto /etc/user/init.d
	newexe "${FILESDIR}/musicd.initd" musicd

	insinto /etc/user/conf.d
	newins "${FILESDIR}/musicd.conf" musicd
}
