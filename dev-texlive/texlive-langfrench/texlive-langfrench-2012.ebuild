# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-langfrench/texlive-langfrench-2012.ebuild,v 1.1 2012/07/27 02:10:19 aballier Exp $

EAPI="4"

TEXLIVE_MODULE_CONTENTS="aeguill basque-book basque-date bib-fr bibleref-french booktabs-fr droit-fr facture frenchle frletter impnattypo mafr tabvar tdsfrmath variations hyphen-basque hyphen-french collection-langfrench
"
TEXLIVE_MODULE_DOC_CONTENTS="aeguill.doc basque-book.doc basque-date.doc bib-fr.doc bibleref-french.doc booktabs-fr.doc droit-fr.doc facture.doc frenchle.doc frletter.doc impnattypo.doc mafr.doc tabvar.doc tdsfrmath.doc variations.doc "
TEXLIVE_MODULE_SRC_CONTENTS="basque-book.source basque-date.source bibleref-french.source facture.source impnattypo.source tabvar.source tdsfrmath.source "
inherit  texlive-module
DESCRIPTION="TeXLive French"

LICENSE="GPL-2 as-is GPL-1 LPPL-1.2 LPPL-1.3 public-domain "
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2012
"
RDEPEND="${DEPEND} "