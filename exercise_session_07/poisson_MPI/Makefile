project := poisson

CFLAGS = -O3 -ffast-math -mavx2
CXXFLAGS += -Wall -Wconversion -Wextra
# CXXFLAGS += -Werror

# NOTE: (aver) Need to use CXX if I don't want to specify the build steps below
CXX=CC
# CC=/usr/local/Cellar/open-mpi/4.1.0/bin/mpicxx
# CC=/usr/local/Cellar/gcc/10.2.0_4/bin/g++-10
# CC = CC

# NOTE: (aver) cannot parallelize build if  move is one of the requirements, good to know
all: ${project}
	mkdir -p build
	mv *.o build

init.o: init.cpp
io.o: io.cpp
jacobi.o: jacobi.cpp
mpi_module.o: mpi_module.cpp
main.o: main.cpp mpi_module.o jacobi.o io.o init.o

${project}: main.o init.o io.o jacobi.o mpi_module.o
	${CXX} *.o -o ${project}

clean:
	rm -f build/* ${project} output.log error.log
move:
	mkdir -p build
	mv *.o build
