# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-brctl/selinux-brctl-2.20140311-r6.ebuild,v 1.1 2014/08/21 19:31:05 swift Exp $
EAPI="5"

IUSE=""
MODS="brctl"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for brctl"

KEYWORDS="~amd64 ~x86"
