
CPPFLAGS=-O3 -ffast-math -mavx2
CPPFLAGS+=-fopenmp
LDFLAGS=-fopenmp
CC=CC

all: nbody_omp nbody_serial

nbody_omp: nbody_omp.cpp

nbody_serial: nbody_serial.cpp

clean:
	rm -f nbody_serial nbody_omp *.o
