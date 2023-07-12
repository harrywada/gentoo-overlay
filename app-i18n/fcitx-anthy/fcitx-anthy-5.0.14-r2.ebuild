# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

if [[ "${PV}" =~ (^|\.)9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fcitx/fcitx5-anthy"
fi

DESCRIPTION="Anthy wrapper for Fcitx"
HOMEPAGE="https://github.com/fcitx/fcitx5-anthy"
if [[ "${PV}" =~ (^|\.)9999$ ]]; then
	SRC_URI=""
else
	SRC_URI="https://github.com/fcitx/fcitx5-anthy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi
S="${WORKDIR}/fcitx5-anthy-${PV}"

LICENSE="LGPL-2.1 unicode"
SLOT="5"
KEYWORDS="~amd64"

BDEPEND="virtual/pkgconfig"
DEPEND="
	>=app-i18n/fcitx-5.0.0:5
	app-i18n/anthy
	virtual/libintl
"
RDEPEND="${DEPEND}"

DOCS=(AUTHORS)

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
