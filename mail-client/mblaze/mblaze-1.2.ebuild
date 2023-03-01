# Copyright 2023 Harry Wada <spam@harrywada.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Unix utilities to deal with Maildir"
HOMEPAGE="https://github.com/leahneukirchen/mblaze"
if [[ ${PV} = 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/leahneukirchen/mblaze"
else
	SRC_URI="https://github.com/leahneukirchen/mblaze/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="public-domain MIT"
SLOT="0"
DOCS=(NEWS.md VIOLATIONS.md filter.example mlesskey.example)
IUSE="tools zsh-completion"

src_install() {
	emake PREFIX="${EPREFIX}/usr/" DESTDIR="${D}" install
	einstalldocs

	if use tools; then
		tools=(                  \
			contrib/malternative \
			contrib/mblow        \
			contrib/mcount       \
			contrib/mencrypt     \
			contrib/menter       \
			contrib/mfillmid     \
			contrib/mgpg         \
			contrib/mhasatt      \
			contrib/mmailto      \
			contrib/mmairix      \
			contrib/mp7m         \
			contrib/mpeek        \
			contrib/mraw         \
			contrib/mrecode      \
			contrib/msearch      \
			contrib/msendmail    \
			contrib/msign        \
			contrib/msuck        \
			contrib/mtwoscan     \
			contrib/mverify      \
			contrib/mvi          \
		)
		mans=(                   \
			contrib/msearch.1    \
		)

		dobin ${tools[@]}
		doman ${mans[@]}
	fi

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions/
		doins contrib/_mblaze
	fi
}