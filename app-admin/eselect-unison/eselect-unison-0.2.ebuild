# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-unison/eselect-unison-0.2.ebuild,v 1.2 2012/02/05 18:46:17 armin76 Exp $

inherit eutils

DESCRIPTION="unison module for eselect"
HOMEPAGE="http://www.gentoo.org/proj/en/eselect/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.2.3"

src_install() {
	local MODULEDIR="/usr/share/eselect/modules"
	local MODULE="unison"
	dodir ${MODULEDIR}
	insinto ${MODULEDIR}
	newins "${FILESDIR}/${MODULE}.eselect-${PVR}" ${MODULE}.eselect \
		|| die "failed to install"
}
