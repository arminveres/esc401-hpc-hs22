
CPPFLAGS=-O3 -ffast-math -mavx2
CPPFLAGS+=-fopenmp
LDFLAGS=-fopenmp
CC=CC

all: nbody_omp nbody

nbody_omp: nbody_omp.cpp

nbody: nbody.cpp

clean:
	rm -f nbody nbody_omp *.o
