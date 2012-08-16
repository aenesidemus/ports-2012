# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/fcgi/fcgi-0.8.8.ebuild,v 1.1 2012/08/16 03:43:57 flameeyes Exp $

EAPI=2
USE_RUBY="ruby18 jruby"

RUBY_FAKEGEM_NAME="${PN/ruby-/}"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC="README README.signals ChangeLog"

inherit ruby-fakegem eutils

DESCRIPTION="FastCGI library for Ruby"
HOMEPAGE="http://rubyforge.org/projects/fcgi/"

KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
LICENSE="Ruby"

DEPEND="dev-libs/fcgi"
RDEPEND="${DEPEND}"

IUSE=""
SLOT="0"

each_ruby_compile() {
	case ${RUBY} in
		*ruby18)
			pushd ext/fcgi
			${RUBY} extconf.rb || die "extconf failed"
			emake || die "emake ext failed"
			popd
			cp ext/fcgi/fcgi.so lib || die
			;;
	esac
}