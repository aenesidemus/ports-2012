# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/facets/facets-2.9.3.ebuild,v 1.1 2014/05/15 18:05:29 p8952 Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Facets is the premier collection of extension methods for Ruby."
HOMEPAGE="https://rubyworks.github.io/facets/"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? (
	dev-ruby/ae
	dev-ruby/lemon
	dev-ruby/rubytest
	dev-ruby/rubytest-cli )"

all_ruby_prepare() {

	# Tests need to write to tmp/
	mkdir tmp/ || die 'mkdir failed'

	# See TODO: https://github.com/rubyworks/facets/blob/2.9.3/test/core/kernel/test_source_location.rb
	rm test/core/kernel/test_source_location.rb || die 'test removal failed'
}

each_ruby_test() {
	${RUBY} -S rubytest -r lemon -r ae -Ilib/core -Ilib/standard -Itest test/ || die 'tests failed'
}
