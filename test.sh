#!/bin/sh
# see LICENSE file for copyright and license information

USAGE="Usage: $0 <PROGRAM> <DIR>"

test "$1" = "-h" &&
	echo $USAGE &&
	exit 0

test -z "$1" && 
	echo $USAGE &&
	exit 1

test -z "$2" && 
	echo $USAGE &&
	exit 1

PROG="$1"
TESTS="$2"

VERBOSITY=1

if ! [ -z $3 ]; then
	while [[ ! -z "$3" ]]; do
		case "$3" in
			-s) 
				VERBOSITY=0
				shift
			;;
			-v) 
				VERBOSITY=2
				shift
			;;
			*) 
				echo "Unrecognized option: $3"
				exit 1
			;;
		esac
	done
fi

ERR=""

SCRIPTS=$(find $TESTS -type f -name "*.sh")

test -z "$SCRIPTS" &&
	echo 123 &&
	exit 1

_echo() {
	test "$VERBOSITY" = "0" && return
	echo $1
}

_echov() {
	test "$VERBOSITY" = "2" || return
	echo $1
}

_echo "RUNNING TESTS"
_echo

for script in $SCRIPTS; do
	_echo $script;
	tmp=$(sh ./$script ./$PROG 2>&1)
	out=$(echo $?)
	_echov "$tmp"
	if [ 0 -ne $out ]; then
		ERR+=$script
	fi
done

if ! [ -z "$ERR" ]; then
	_echo
	_echo "FAILED"
	_echo
	for file in "$ERR"; do
		_echo $file
		tmp=$(grep "##DSC " $file | sed -e "s/##DSC //")
		test -z "$tmp" || {
			_echo DESCRIPTION && _echo $tmp
		}
		tmp=$(grep "##ERR " $file | sed -e "s/##ERR //")
		test -z "$tmp" || {
			_echo ERROR && _echo $tmp
		}
		_echo
	done
	exit 2
fi

_echo
_echo "OK"
exit 0
