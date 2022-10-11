CFLAGS := -O3 -fopenmp
LDFLAGS := -fopenmp

all: cpi cpi_mpi sum

cpi: cpi.o gettime.o

cpi_mpi: cpi_mpi.o gettime.o

sum: sum.o gettime.o

clean:
	rm -f *.o
cleanall: clean
	rm -f cpi cpi_mpi sum
