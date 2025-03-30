# test.sh

`test.sh` is a shell script for running full-program tests on a specified 
program

## features

- tests programs
- using shell

## usage

### running tests

```sh
$ test.sh <program-path> <test-directory> [-s|-v]
```

### writing tests

first, create a directory for your tests

```sh
$ mkdir tests
```

inside this directory, create a shell script

this shell script is the test for the program. the script should return 0 when 
the test is passed

use `$1` for the current program being tested

## examples

this repository contains a simple example program, `pow`, which you can compile
using the provided makefile. you can run tests on it by running `make test` or
running `./test.sh pow tests/pow`

## license and copyright

licensed under the GNU GPLv3.0 or any later version, at your option. see 
LICENSE file for license and copyright information
