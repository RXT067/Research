# Krey's Template for Gentoo's ebuild EAPI 6
# Copyright 1999-2018 Gentoo Authors, Kreyren (github.com/kreyren)
# Distributed under the terms of the GNU General Public License v2
# Based on master index https://devmanual.gentoo.org/

## OVERRIDES
DEPEND=$DEPENDENCIES 
RDEPEND=$RUNTIME_DEPENDENDIES
PDEPEND=$POST_DEPENDENDANCIES

EAPI=6

DESCRIPTION= # A short (not more than 80 characters) description of the package's purpose. Mandatory.

HOMEPAGE= #	Package's homepage. Mandatory (except for virtuals).

SRC_URI= # A list of source URIs for the package. Can contain USE-conditional parts - https://devmanual.gentoo.org/ebuild-writing/variables/index.html#src_uri

LICENSE= # The package's license, corresponding exactly (including case) to a file in licenses/. Mandatory (except for virtuals) - https://devmanual.gentoo.org/ebuild-writing/variables/index.html#license

SLOT= # The package's SLOT. Mandatory - https://devmanual.gentoo.org/ebuild-writing/variables/index.html#slot

KEYWORDS= # https://devmanual.gentoo.org/ebuild-writing/variables/index.html#keywords

IUSE= #	A list of all USE flags (excluding arch flags, but including USE_EXPAND flags) used within the ebuild - https://devmanual.gentoo.org/ebuild-writing/variables/index.html#iuse.

REQUIRED_USE= # A list of assertions that must be met by the configuration of USE flags to be valid for this ebuild - https://devmanual.gentoo.org/ebuild-writing/variables/index.html#required_use

RESTRICT= #	A space-delimited list of portage features to restrict. Valid values are fetch, mirror, strip, test and userpriv. See man 5 ebuild for details.

DEPENDENCIES= # A list of the package's build dependencies - https://devmanual.gentoo.org/general-concepts/dependencies/index.html

RUNTIME_DEPENDENDIES= # https://devmanual.gentoo.org/general-concepts/dependencies/index.html

POST_DEPENDENDANCIES= # Use this only when RDEPEND would cause cyclic dependencies.

JAZZHANDS () {
# JAZZHANDS, Krey's version of gentoo's shorthand that MAKES SENCE
## https://devmanual.gentoo.org/ebuild-writing/variables/

P=$PNAV
## Package Name And Version

CATEGORY=$PC 
## Package Category

PN=$PN
## Package Name

PV=$PV
## Package Version

PR=$PR
## Package Revision

PVR=$PVAR
## Package Version And Revision

PF=$FPN
## Full Package Name


PORTDIR=/var/tmp/portage/${PC}/${PNAV}
## PORTage DIRectory

BUILDDIR=${PORTDIR}/build

FILESDIR=${PORTDIR}/files

WORKDIR=${PORTDIR}/work

HOMEDIR=${PORTDIR}/home

DISTDIR=${PORTDIR}/distdir

IMAGEDIR=${PORTDIR}/image

SOURCEDIR=${WORKDIR}/${PNAV}

ROOT=/



BUILDDIR=$PBD
## Package Build Directory

FILESDIR=$PFD
## Package Files Directory

WORKDIR=$PWD
## Package Work Directory

HOMEDIR=$PHD
## Package Home Directory

DISTDIR=$PDD
## Package Distribution Directory

IMAGEDIR=$PID
## Package Image Directory

SOURCEDIR=$PSD
## Package Source Directory

ROOT=/ # I AM ROOT

}

# FUNCTIONS - https://devmanual.gentoo.org/ebuild-writing/functions/index.html
