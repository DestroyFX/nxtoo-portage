# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-board/gamazons/gamazons-0.83.ebuild,v 1.5 2014/10/30 17:30:11 mr_bones_ Exp $

EAPI=5
inherit gnome2

DESCRIPTION="A chess/go hybrid"
HOMEPAGE="http://www.yorgalily.org/gamazons/"
SRC_URI="http://www.yorgalily.org/${PN}/src/$P.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"
IUSE=""

DEPEND=">=gnome-base/libgnomeui-2"
RDEPEND=${DEPEND}

src_prepare() {
	gnome2_src_prepare
	sed -i \
		-e '/^Encoding/d' \
		-e '/Categories/s/GNOME;Application;//' \
		-e '/Icon/s/\.png//' \
		pixmaps/gamazons.desktop \
		|| die
}
