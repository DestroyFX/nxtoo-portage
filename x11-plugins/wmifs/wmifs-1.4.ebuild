# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/wmifs/wmifs-1.4.ebuild,v 1.1 2014/10/27 10:49:52 voyageur Exp $

EAPI=5
inherit toolchain-funcs

DESCRIPTION="Network monitoring dockapp"
HOMEPAGE="http://windowmaker.org/dockapps/?name=wmtime"
SRC_URI="http://windowmaker.org/dockapps/?download=${P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXpm"
DEPEND="${RDEPEND}
	x11-proto/xextproto"

S=${WORKDIR}/dockapps/${PN}

src_prepare() {
	# Honour Gentoo LDFLAGS, see bug #336537
	sed -i "s/-o wmifs/\$(LDFLAGS) -o wmifs/" Makefile || die "sed failed"
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}"
}

src_install() {
	emake DESTDIR="${D}" prefix=/usr install
	dodoc ../BUGS ../CHANGES ../HINTS ../README ../TODO
}
