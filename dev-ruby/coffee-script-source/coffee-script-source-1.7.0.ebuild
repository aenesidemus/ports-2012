# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/coffee-script-source/coffee-script-source-1.7.0.ebuild,v 1.3 2014/05/21 01:47:45 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 jruby"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Ruby CoffeeScript is a bridge to the official CoffeeScript compiler."
HOMEPAGE="http://jashkenas.github.io/coffee-script/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~x64-macos ~x86-solaris"

IUSE=""
