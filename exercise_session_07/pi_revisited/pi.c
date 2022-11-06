#include <math.h>
#include <mpi.h>
// #include <openmpi-x86_64/mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    const int N = 1000000000;
    const double GIVEN_PI = 3.141592653589793;

    // Initialize the MPI environment
    MPI_Init(NULL, NULL);

    // Get the number of processes and rank of the process
    int size, my_rank;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    double my_sum = 0;

    for (int i = my_rank; i < N; i += size) {
        my_sum += pow(-1, i) / (2 * i + 1);
    }

    double final_sum = 0;
    MPI_Reduce(&my_sum, &final_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    printf("I am processor %d out of %d\n", my_rank, size);
    if (my_rank == 0) {
        const double MY_PI = 4 * final_sum;
        printf("Approximated PI: %.20f\n", MY_PI);
        printf("Given PI: %.20f\n", GIVEN_PI);
        printf("Diff %.20f\n", MY_PI - GIVEN_PI);
    }

    // Finalize the MPI environment.
    MPI_Finalize();
}
