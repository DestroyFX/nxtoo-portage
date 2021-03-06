# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-voip/vidyodesktop/vidyodesktop-3.3.0.027.ebuild,v 1.1 2014/10/10 16:16:37 prometheanfire Exp $

EAPI=5

inherit eutils versionator rpm

DESCRIPTION="Enterprise video conferencing platform"
HOMEPAGE="http://www.vidyo.com/"
SRC_URI="
	amd64? ( https://demo.vidyo.com/upload/VidyoDesktopInstaller-sl564-TAG_VD_$(replace_all_version_separators _).rpm )
	x86?   ( https://demo.vidyo.com/upload/VidyoDesktopInstaller-sl5-TAG_VD_$(replace_all_version_separators _).rpm )
"

LICENSE="Vidyo-EULA"
SLOT="0"
RESTRICT="mirror strip"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"

QA_PREBUILT="/opt/vidyo/VidyoDesktop/VidyoDesktopInstallHelper
	/opt/vidyo/VidyoDesktop/RenderCheck
	/opt/vidyo/VidyoDesktop/VidyoDesktop"

DEPEND=""
RDEPEND="
	app-arch/bzip2
	dev-libs/expat
	dev-libs/glib
	dev-libs/libffi
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/glu
	media-libs/libpng
	media-libs/mesa
	net-dns/libidn
	sys-libs/zlib
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXv
	x11-libs/libXxf86vm
"

src_install() {
	cp -a opt "${D}"
	doicon usr/share/pixmaps/vidyo_icon.png
	dodoc opt/vidyo/VidyoDesktop/license.txt
	rm "${D}opt/vidyo/VidyoDesktop/license.txt"
	exeinto /opt/bin
	doexe usr/bin/VidyoDesktop
	make_desktop_entry VidyoDesktop VidyoDesktop vidyo_icon 'AudioVideo;Network;'
}
