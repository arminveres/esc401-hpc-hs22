#include <cstring>
#include <iostream>

static constexpr uint32_t len_dim0 = 2;
static constexpr uint32_t len_dim1 = 5;

void print_mat(int **M) {
  printf("Printing Matrix: \n");
  for (size_t i = 0; i < len_dim0; i++) {
    for (size_t j = 0; j < len_dim1; j++) {
      printf("%d  ", M[i][j]);
    }
    printf("\n");
  }
  printf("Done\n");
}

int swap_0axis(int **M, int **M2) {
  if (M == nullptr || M2 == nullptr) {
    return 1;
  }
  for (size_t i = 0; i < len_dim0; i++) {
    for (size_t j = 0; j < len_dim1; j++) {
      // M2[i][j] = M[len_dim0 - 1 - i][len_dim1 - 1 - j];
      size_t rev_i = len_dim0 - 1 - i;
      size_t rev_j = len_dim1 - 1 - j;
      *(*(M2 + i) + j) = *(*(M + rev_i) + rev_j);
    }
  }
  return 0;
}

int main() {
  int **M = new int *[len_dim0];
  M[0] = new int[len_dim1]{0, 1, 2, 3, 4};
  M[1] = new int[len_dim1]{5, 6, 7, 8, 9};

  int **M2 = new int *[len_dim0];
  M2[0] = new int[len_dim1];
  M2[1] = new int[len_dim1];

  swap_0axis(M, M2);
  print_mat(M);
  print_mat(M2);

  delete[] M2;
  delete[] M;
  return 0;
}
