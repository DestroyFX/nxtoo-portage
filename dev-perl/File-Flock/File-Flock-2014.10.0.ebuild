# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/File-Flock/File-Flock-2014.10.0.ebuild,v 1.3 2014/10/16 01:31:08 blueness Exp $

EAPI=5

MODULE_AUTHOR=MUIR
MODULE_VERSION=2014.01
MODULE_SECTION=modules
inherit perl-module

DESCRIPTION="flock() wrapper.  Auto-create locks"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="test"

SRC_TEST="do"

RDEPEND="
	dev-perl/Data-Structure-Util
	>=dev-perl/IO-Event-0.812.0
	dev-perl/AnyEvent
	dev-perl/Event
	virtual/perl-Time-HiRes
"
DEPEND="${RDEPEND}
	dev-perl/File-Slurp
	test? ( dev-perl/Test-SharedFork )
"