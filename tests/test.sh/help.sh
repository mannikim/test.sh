#!/bin/sh
# see LICENSE file for copyright and license information
##DSC Check if -h is printing the usage sucessfully
##ERR Program failed to print usage
$1 -h && exit 0 || exit 1
