# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/expects/expects-0.5.0.ebuild,v 1.1 2014/10/25 04:09:17 alunduil Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 python3_3 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Expressive and extensible TDD/BDD assertion library for Python"
HOMEPAGE="https://github.com/jaimegildesagredo/expects"
SRC_URI="https://github.com/jaimegildesagredo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( >=dev-python/mamba-0.8.2[${PYTHON_USEDEP}] )
"
RDEPEND=""

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	mamba || die "Tests failed under ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )

	distutils-r1_python_install_all
}
