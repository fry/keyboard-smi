# gt.m4 - Macros to locate and utilise giellatekno scripts -*- Autoconf -*-
# serial 1 (gtsvn-1)
# 
# Copyright © 2011 Divvun/Samediggi/UiT <bugs@divvun.no>.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# As a special exception to the GNU General Public License, if you
# distribute this file as part of a program that contains a
# configuration script generated by Autoconf, you may include it under
# the same distribution terms that you use for the rest of that program.

# the prefixes gt_*, _gt_* are reserved here for giellatekno variables and
# macros. It is the same as gettext and probably others, but I expect no
# collisions really.


AC_DEFUN([gt_PROG_SCRIPTS_PATHS],
         [
# Define whether you want to be a maintainer:
AC_ARG_VAR([GTMAINTAINER], [define if you are maintaining the infra to get additional complaining about infra integrity])
AM_CONDITIONAL([WANT_MAINTAIN], [test x"$GTMAINTAINER" != x])

AC_PATH_PROG([GTVERSION], [gt-version.sh], [false],
             [$GTCORE/scripts/$PATH_SEPARATOR$GTHOME/gtcore/scripts/])
AS_IF([test "x$GTSCRIPT" = xfalse], 
      [cat<<<EOT
Could not find giellatekno core scripts in:
       $GTCORE/scripts 
       $GTHOME/gtcore/scripts 
       $PATH 
Please do one of the following: 
       a. svn co https://victorio.uit.no/langtech/trunk/gtcore
       b. cd gtcore/scripts && ./autogen.sh && ./configure && make install
       c. $GTHOME/gt/script/gtsetup.sh
       d. add "export GTCORE=path/to/gtcore" to your ~/.profile or similar
EOT
       AC_MSG_ERROR([gtversion.sh could not be executed])])

]) # gt_PROG_SCRIPTS_PATHS

AC_DEFUN([gt_PRINT_FOOTER],
[
cat<<EOF
-- Building $PACKAGE_STRING:

For more ./configure options, run ./configure --help

To build installation packages for the keyboards, do:
    make
EOF
]) # gt_PRINT_FOOTER
# vim: set ft=config: 
