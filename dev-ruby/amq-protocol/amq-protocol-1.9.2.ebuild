# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/amq-protocol/amq-protocol-1.9.2.ebuild,v 1.2 2014/05/02 14:54:17 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="ChangeLog.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="An AMQP 0.9.1 serialization library for Ruby."
HOMEPAGE="http://github.com/ruby-amqp/amq-protocol"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

all_ruby_prepare() {
	rm Gemfile || die
	sed -i -e '/bundler/ s:^:#:' -e '/effin_utf8/ s:^:#:' spec/spec_helper.rb || die
}
