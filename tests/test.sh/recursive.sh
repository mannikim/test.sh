#!/bin/sh
# see LICENSE file for copyright and license information
##DSC Tests itself
$1 $1 ./$(dirname "$0")/recursive && exit 0 || exit 1
