# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Execute scripts on IMAP mailbox changes using IDLE"
HOMEPAGE="https://gitlab.com/shackra/goimapnotify"
COMMIT="423f0e65350f7e042edbd2c373f252c5a0d31dc2"
SRC_URI="https://gitlab.com/shackra/goimapnotify/-/archive/2.4-rc4/${PN}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://www.harrywada.com/gentoo/${PF}-deps.tar.xz"

S="${WORKDIR}/${P}-rc4-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-lang/go-1.20"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	ego build
}

src_install() {
	dobin goimapnotify
	default
}
