# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-nntp/brag/brag-1.4.3.ebuild,v 1.4 2012/03/19 19:12:18 armin76 Exp $

EAPI=4

DESCRIPTION="Brag collects and assembles multipart binary attachments from newsgroups"
HOMEPAGE="http://brag.sourceforge.net/"
SRC_URI="mirror://sourceforge/brag/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE=""

RDEPEND="dev-lang/tcl
	app-text/uudeview"

src_compile() { :; }

src_install() {
	dobin brag
	dodoc CHANGES README
	doman brag.1
}
