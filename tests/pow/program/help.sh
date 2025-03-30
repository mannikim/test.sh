#!/bin/sh
# see LICENSE file for copyright and license information
##DSC -h is printing the usage correctly
##ERR Program failed to print usage
$1 -h && exit 0 || exit 1
