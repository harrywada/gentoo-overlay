# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{4..11} pypy3 )
inherit distutils-r1 systemd

DESCRIPTION="A lightweight yet complete CardDAV/CalDAV server that backs onto a Git repository"
HOMEPAGE="https://www.xandikos.org/"
SRC_URI="https://github.com/jelmer/${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="metrics"

RDEPEND="
	acct-user/xandikos
	acct-group/xandikos
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/icalendar[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.19.1[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
	>=dev-python/jinja-2[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]

	metrics? (
		dev-python/prometheus_client[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	epytest xandikos/tests/
}

python_install_all() {
	newinitd "${FILESDIR}/${P}.init.d" xandikos
	systemd_dounit "${WORKDIR}/${P}/examples/xandikos.service"

	keepdir /var/lib/xandikos
	fperms 0750 /var/lib/xandikos
	fowners xandikos:xandikos /var/lib/xandikos

	distutils-r1_python_install_all
}
