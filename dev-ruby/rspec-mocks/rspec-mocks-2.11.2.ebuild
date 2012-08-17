# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rspec-mocks/rspec-mocks-2.11.2.ebuild,v 1.1 2012/08/16 17:51:31 flameeyes Exp $

EAPI=4
USE_RUBY="ruby18 ree18 ruby19 jruby"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="Changelog.md README.md"

inherit ruby-fakegem

DESCRIPTION="A Behaviour Driven Development (BDD) framework for Ruby"
HOMEPAGE="http://rspec.rubyforge.org/"
SRC_URI="https://github.com/rspec/${PN}/tarball/v${PV} -> ${P}-git.tgz"
RUBY_S="rspec-${PN}-*"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "
	test? (
		>=dev-ruby/rspec-core-2.10.0:2
		dev-ruby/rspec-expectations:2
	)"

all_ruby_prepare() {
	# Don't set up bundler: it doesn't understand our setup.
	sed -i -e '/[Bb]undler/d' Rakefile || die

	# Remove the Gemfile to avoid running through 'bundle exec'
	rm Gemfile || die
}

each_ruby_test() {
	RUBYOPT="${RUBYOPT} -ryaml" each_fakegem_test
}