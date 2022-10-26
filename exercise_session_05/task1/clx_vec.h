#ifndef complex_vector
#include <stdint.h>

// #define VEC_LEN 1000
#define VEC_LEN 10

typedef struct complex_vector {
  float real[VEC_LEN];
  float imag[VEC_LEN];
} complex_vector;

#endif // !complex_vector
