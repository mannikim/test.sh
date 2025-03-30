#!/bin/sh
# see LICENSE file for copyright and license information
##DSC Fail when using excessive arguments
##ERR Program accepted more arguments then it should
$1 $1 . a && exit 1 || exit 0
