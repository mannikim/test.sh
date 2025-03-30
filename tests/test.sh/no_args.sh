#!/bin/sh
# see LICENSE file for copyright and license information
##DSC Should fail if no args are provided
$1 && exit 1 || exit 0
