# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

if [[ "${PV}" =~ (^|\.)9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fcitx/fcitx5-zhuyin.git"
	SRC_URI=""
else
	MY_PN="fcitx5-zhuyin"
	S="${WORKDIR}/${MY_PN}-${PV}"
	SRC_URI="https://download.fcitx-im.org/fcitx5/fcitx5-zhuyin/fcitx5-zhuyin-${PV}_dict.tar.xz"
fi

DESCRIPTION="Libzhuyin wrapper for Fcitx"
HOMEPAGE="https://github.com/fcitx/fcitx5-zhuyin"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="~amd64"

DEPEND=">=app-i18n/fcitx-5.0.2:5"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	sys-devel/gettext
"

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}