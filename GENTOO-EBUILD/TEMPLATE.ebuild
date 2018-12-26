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

pkg_pretend () { 
# run sanity checks for a package during dependency calculation time

	if use kernel_linux ; then
		if [[ -e "${ROOT}"/usr/src/linux/.config ]] ; then
			if kernel_is lt 2 6 30 ; then
				CONFIG_CHECK="FUSE_FS"
				ERROR_FUSE_FS="this is an unrealistic testcase..."
				check_extra_config
			fi
		fi
	fi
}

pkg_nofetch () {
# Tell the user how to deal with fetch-restricted packages

	[ -z "${SRC_URI}" ] && return

	echo "!!! The following are listed in SRC_URI for ${PN}:"
	for MYFILE in `echo ${SRC_URI}`; do
		echo "!!!   $MYFILE"
	done
	return
}

pkg_setup () {
# https://devmanual.gentoo.org/ebuild-writing/functions/pkg_setup/index.html

	return
}

src_unpack () {
# Extract source packages and do any necessary patching or fixes.

	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_prepare () {
# Prepare source packages and do any necessary patching or fixes.

	if declare -p PATCHES | grep -q "^declare -a "; then
        [[ -n ${PATCHES[@]} ]] && eapply "${PATCHES[@]}"
    else
        [[ -n ${PATCHES} ]] && eapply ${PATCHES}
    fi
    eapply_user
}

src_configure () {
# Configure the package.

	if [[ -x ${ECONF_SOURCE:-.}/configure ]] ; then
		econf
	fi
}

src_compile () {
# Configure and build the package.

	if [ -x ./configure ]; then
		econf
	fi

	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}

src_test () {
# Run pre-install test scripts

	if emake check -n &> /dev/null; then
		emake check
	elif emake test -n &> /dev/null; then
		emake test
	fi
}

src_install () {
# Install a package to ${IMAGEDIR}

	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
		emake DESTDIR="${D}" install
	fi

	if ! declare -p DOCS >/dev/null 2>&1 ; then
		local d
		for d in README* ChangeLog AUTHORS NEWS TODO CHANGES THANKS BUGS \
				FAQ CREDITS CHANGELOG ; do
			[[ -s "${d}" ]] && dodoc "${d}"
		done
	elif declare -p DOCS | grep -q "^declare -a " ; then
		dodoc "${DOCS[@]}"
	else
		dodoc ${DOCS}
	fi
}

pkg_preinstall () {
# Called before image is installed to ${ROOT}

	enewgroup foo
	enewuser foo -1 /bin/false /dev/null foo
}

pkg_postinst () {
# Called after image is installed to ${ROOT}

	if $OLD_FLUXBOX_VERSION ; then
		ewarn "You must restart fluxbox before using the [include] /directory/"
		ewarn "feature if you are upgrading from an older fluxbox!"
		ewarn " "
	fi
	elog "If you experience font problems, or if fluxbox takes a very"
	elog "long time to start up, please try the 'disablexmb' USE flag."
	elog "If that fails, please report bugs upstream."
}

pkg_prerm () {
# Called before a package is unmerged

	return
}

pkg_postrm () {
# Called after image is installed to ${ROOT}

	return
}

pkg_config () {
# Run any special post-install configuration

	eerror "This ebuild does not have a config function."
}

pkg_info () {
# display information about a package

	return
}
