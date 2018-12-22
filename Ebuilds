# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# these two shits above are standard shits

# GDTISSIHLBMS_YAAY 
# SRC_URI and scr_install () are the most important
## SRC_URI == SOURCE URL
## Everythinig in SRC_URI is placed+unarchived in WORKDIR
# SLOT is mandatory
## SLOT DOES NOT works with "", "0" is acceptable
# *   The source directory '/var/tmp/portage/media-gfx/NoxMentor-0.1/work/NoxMentor-0.1' doesn't exist
## Portage needs this dir
## NoxMentor-0.1 needs to be created or S VAR specified
##
# ${S} == SOurce directory?
## Can be set to multiple dirs
## Needs to be a dir(?)
# After each change in an ebuild, the ebuild has to be re-ebuild using 'ebuild $package manifest' command.
# ${WORKDIR} == /var/tmp/portage/media-gfx/NoxMentor-0.1/work/
# RDEPEND == Runtime Dependancy
# DEPEND == Build dependancy
# If $WORKDIR is present making build dir is not required.
## because reasons!
# $WORKDIR/build
## 1) you are doing it manually, not through portage, docs don't know portage. so they randomly take a name for a build folder, coincidental it's called build
## 2) they propose you to build in different folder out of runtime reasoning so I propose you to do the next thing
# WARN: We are in sandbox chroot isolated from main system e.i: make install, pwd, etc. won't work as they should probably
# doins/insinto
## insinto where_i_want
## doins what_i_want

#KREY: D - /var/tmp/portage/media-gfx/NoxMentor-0.1/image/
#KREY: P - NoxMentor-0.1
#KREY: V - 
#KREY: PV - 0.1 -> something/something-${PV}

# E-build API
EAPI=6

inherit qmake-utils

DESCRIPTION="Powerful yet simple to use screenshot software."
KEYWORDS="~x86 ~amd64"
HOMEPAGE="https://flameshot.js.org/"
LICENSE="FreeArt GPL-3+ Apache-2.0"

# TODO: more kitties https://turning.ca/i/vintage/Cat%20and%20Staff%20Pictures/Henry_AboutUs.jpg
SRC_URI="https://github.com/lupoDharkael/flameshot/archive/v0.6.0.tar.gz https://pcdn.columbian.com/wp-content/uploads/2016/09/111811-bookstore-cat_07.jpg"
SLOT="0"
S=$WORKDIR

DEPEND="
	>=dev-qt/qtcore-5.3
	>=sys-devel/gcc-4.9.2
	"

RDEPEND="
	>=dev-qt/qtcore-5.3"

# USE FLAGS

src_configure () {
	mkdir eazy-krey
	mv 111811-bookstore-cat_07.jpg eazy-krey/KREYREEEEEEEEEEENNNNNNNNNNNN.jpg

}

src_compile() {
	mkdir -p $WORKDIR/flameshot-0.6.0/krey_is_building
	cd $WORKDIR/flameshot-0.6.0/krey_is_building
	qmake ../
	make
}

src_install () {
  insinto /opt/flameshot
  #let's copy this from inside WORKDIR, into the system folder
  doins -r flameshot* 
  # let's copy these libraries into the physical system folder /opt/flameshot.
  doins *.o
}
