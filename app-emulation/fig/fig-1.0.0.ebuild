# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/fig/fig-1.0.0.ebuild,v 1.1 2014/10/27 15:25:51 alunduil Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Punctual, lightweight development environments using Docker"
HOMEPAGE="http://www.fig.sh/"
SRC_URI="https://github.com/docker/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

CDEPEND="
	>=dev-python/dockerpty-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/docker-py-0.5[${PYTHON_USEDEP}]
	<dev-python/docker-py-0.6[${PYTHON_USEDEP}]
	>=dev-python/docopt-0.6.1[${PYTHON_USEDEP}]
	<dev-python/docopt-0.7[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	<dev-python/pyyaml-4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.2.1[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
	>=dev-python/six-1.3.0[${PYTHON_USEDEP}]
	<dev-python/six-2[${PYTHON_USEDEP}]
	>=dev-python/texttable-0.8.1[${PYTHON_USEDEP}]
	<dev-python/texttable-0.9[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-0.11.0[${PYTHON_USEDEP}]
	<dev-python/websocket-client-0.12[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		${CDEPEND}
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/unittest2[${PYTHON_USEDEP}]' 'python2*')
	)
"
RDEPEND="${CDEPEND}"

python_prepare_all() {
	# Note: patch is 22KiB but should be removed next release.
	local PATCHES=(
		"${FILESDIR}"/1.0.0-unvendorize-dockerpty.patch
	)
	distutils-r1_python_prepare_all
}

python_test() {
	nosetests tests/unit || die "Tests failed under ${EPYTHON}"
}
