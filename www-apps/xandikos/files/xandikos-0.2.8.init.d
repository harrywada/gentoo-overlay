#!/sbin/openrc-run
# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

command="/usr/bin/xandikos"
command_args="-d /var/lib/xandikos"
command_background=true
command_user="xandikos:xandikos"
pidfile="/run/${RC_SVCNAME}.pid"

depend() {
	need localmount
}
