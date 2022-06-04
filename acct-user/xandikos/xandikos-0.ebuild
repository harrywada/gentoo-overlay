# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for www-apps/xandikos"
ACCT_USER_ID=554
ACCT_USER_GROUPS=( ${PN} )
ACCT_USER_HOME=/var/lib/xandikos

acct-user_add_deps
