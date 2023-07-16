# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="No nonsense Neovim client in Rust"
HOMEPAGE="https://neovide.dev"
SRC_URI="https://github.com/neovide/neovide/releases/download/${PV}/neovide.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
QA_PREBUILT="usr/bin/*"
S="${WORKDIR}"

DEPEND="app-editors/neovim"
RDEPEND="${DEPEND}"

src_install() {
	dobin neovide
}