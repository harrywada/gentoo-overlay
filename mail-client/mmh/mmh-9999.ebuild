# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A mail client for users who like the Unix philosophy"
HOMEPAGE="http://marmaro.de/prog/mmh"
EGIT_REPO_URI="http://git.marmaro.de/mmh"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	./autogen.sh || die "Failed to autogenerate files"
	default
}
