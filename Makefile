# see LICENSE file for copyright and license information
.PHONY = test

pow: pow.c
	gcc -o pow pow.c -lm

test: pow
	./test.sh pow tests/pow
