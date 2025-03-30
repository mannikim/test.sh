// see LICENSE file for copyright and license information

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

void usage(FILE *stream, const char *program) {
  fprintf(stream, "Usage: %s <NUMBER0> <NUMBER1>\n", program);
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    usage(stderr, argv[0]);
    return EXIT_FAILURE;
  }

  if (argv[1][0] == '-' && argv[1][1] == 'h') {
    usage(stdout, argv[0]);
    return EXIT_SUCCESS;
  }

  if (argc != 3) {
    usage(stderr, argv[0]);
    return EXIT_FAILURE;
  }

  double n0 = atof(argv[1]);
  double n1 = atof(argv[2]);

  printf("%g\n", pow(n0, n1));

  return EXIT_SUCCESS;
}
