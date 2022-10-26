#include "../clx_vec.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int fill_vector(complex_vector *vec, float val) {
  for (size_t i = 0; i < VEC_LEN; i++) {
    vec->real[i] = val;
    vec->imag[i] = val;
  }
  return 0;
}

int linear_combination(complex_vector const *x, complex_vector const *y,
                       const float a, complex_vector *const z) {
  if (sizeof(x->real) != sizeof(y->real) ||
      sizeof(x->imag) != sizeof(y->imag)) {
    // return 1 if it was not succesful
    return 1;
  }
  for (size_t i = 0; i < VEC_LEN; i++) {
    // printf("%f\t%fi\n", z->real[i], z->imag[i]);
    z->real[i] = x->real[i] + a * y->real[i];
    z->imag[i] = x->imag[i] + a * y->imag[i];
    // printf("%f\t%fi\n", z->real[i], z->imag[i]);
  }
  return 0;
}

int main() {
  complex_vector *x = new complex_vector;
  complex_vector *y = new complex_vector;
  complex_vector *z = new complex_vector;
  static const float real_a = 2.0;

  fill_vector(x, 2.0);
  fill_vector(y, 2.0);
  fill_vector(z, 0.0);

  linear_combination(x, y, real_a, z);

  delete x;
  delete y;
  delete z;

  return 0;
}
