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

IUSE="+dot flock lockf fnctl"
REQUIRED_USE="^^ ( dot flock lockf fnctl )"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	./autogen.sh || die "Failed to autogenerate files"
	default
}

src_configure() {
	if use dot ; then
		myconf=$(use_with dot locking dot)
	elif use flock ; then
		myconf=$(use_with flock locking flock)
	elif use lockf ; then
		myconf=$(use_with lockf locking lockf)
	elif use fnctl ; then
		myconf=$(use_with fnctl locking fnctl)
	fi
	econf $myconf
}
