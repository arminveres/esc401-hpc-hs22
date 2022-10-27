CXXFLAGS=-O3 -ffast-math -mavx2
WFLAGS := -Wall -Wextra -Wno-conversion #-Werror
CXXFLAGS += $(WFLAGS)

CC=CC

all: init.o io.o jacobi.o main
init.o: init.cpp init.h
io.o: io.cpp io.h
jacobi.o: jacobi.cpp jacobi.h
main: init.o io.o jacobi.o
clean:
	rm -f main init.o io.o jacobi.o
