#include "mpi_module.h"

#include <mpi.h>
#include <stdio.h>

#include "init.h"

int start_MPI(int* my_rank, int* size) {
    printf("Setting MPI environment\n");
    MPI_Init(NULL, NULL);
    MPI_Comm_size(MPI_COMM_WORLD, size);
    MPI_Comm_rank(MPI_COMM_WORLD, my_rank);
    return 0;
}

int close_MPI() {
    MPI_Finalize();
    return 0;
}

int mpi_get_domain(int nx, int ny, int my_rank, int size, int* min_x, int* max_x, int* min_y,
                   int* max_y) {
    /*
    define corners or local domains
    */
    // number of columns divided by number of nodes
    *min_x = nx / size * my_rank;
    *max_x = my_rank == size - 1 ? nx : nx / size * (my_rank + 1);

    *min_y = 0;
    *max_y = ny;

    // printf("in mpi_get_domain() in mpi_module.cpp,  define corners of the local domains\n");

    printf("I am rank %d and my domain is: xmin, xmax, ymin, ymax: %d %d %d %d\n", my_rank, *min_x,
           *max_x, *min_y, *max_y);
    return 0;
}

int halo_comm(params p, int my_rank, int size, double** u, double* fromLeft, double* fromRight) {
    /*
     * this function, vectors fromLeft and fromRight should be received from the neighbours of
     * my_rank process
     *
     * if you want to implement also cartesian topology, you need fromTop and fromBottom in addition
     * to fromLeft a nd fromRight
     */
    const int COL_DIFF = p.ymax - p.ymin;

    for (int j = 0; j < (p.ymax - p.ymin); j++) {
        fromLeft[j] = 0;
        fromRight[j] = 0;
    }  // initialize fromLeft and fromRight

    // double* column_to_right = new double[COL_DIFF];
    double column_to_right[COL_DIFF];
    for (int j = 0; j < (p.ymax - p.ymin); j++) {
        column_to_right[j] = u[p.xmax - p.xmin - 1][j];
    }
    // double* column_to_left = new double[COL_DIFF];
    double column_to_left[COL_DIFF];
    for (int j = 0; j < (p.ymax - p.ymin); j++) {
        column_to_left[j] = u[0][j];
    }

    MPI_Request requests[4];
    for (int i = 0; i < 4; i++) {
        requests[i] = MPI_REQUEST_NULL;
    }

    if (my_rank != size - 1) {
        MPI_Irecv(fromRight, COL_DIFF, MPI_DOUBLE, my_rank + 1, 0, MPI_COMM_WORLD, &requests[0]);
        MPI_Isend(column_to_right, COL_DIFF, MPI_DOUBLE, my_rank + 1, 0, MPI_COMM_WORLD,
                  &requests[1]);
    }
    if (my_rank != 0) {
        MPI_Irecv(fromLeft, COL_DIFF, MPI_DOUBLE, my_rank - 1, 0, MPI_COMM_WORLD, &requests[2]);
        MPI_Isend(column_to_left, COL_DIFF, MPI_DOUBLE, my_rank - 1, 0, MPI_COMM_WORLD,
                  &requests[3]);
    }

    MPI_Waitall(REQ_CNT, requests, MPI_STATUS_IGNORE);

    return 0;
}

int ALLREDUCE(double* loc_diff, double* loc_sumdiff) {
    MPI_Allreduce(loc_diff, loc_sumdiff, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
    return 0;
}
