# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libgrss/libgrss-0.5.0-r1.ebuild,v 1.1 2014/09/26 18:05:17 eva Exp $

EAPI="5"
GCONF_DEBUG="yes"

inherit autotools eutils gnome2

DESCRIPTION="LibGRSS is a library for easy management of RSS/Atom/Pie feeds"
HOMEPAGE="http://live.gnome.org/Libgrss"
SRC_URI="http://gtk.mplat.es/libgrss/tarballs/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0.5"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="examples"

RDEPEND="
	>=dev-libs/glib-2.30.2:2
	>=dev-libs/libxml2-2.7.8:2
	>=net-libs/libsoup-2.36.1:2.4
"
DEPEND="${RDEPEND}
	app-text/gnome-doc-utils
	>=dev-util/gtk-doc-am-1.10
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
"

src_prepare() {
	# Fix soname/.pc
	epatch "${FILESDIR}"/${P}-fix-slotting.patch

	# Fix build with newer glibc
	epatch "${FILESDIR}"/${P}-headers.patch

	eautoreconf
	gnome2_src_prepare
}

src_install() {
	gnome2_src_install

	if use examples ; then
		insinto /usr/share/doc/${PF}
		doins -r examples
	fi
}