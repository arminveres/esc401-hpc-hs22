# CC=pgc++
# cc=pgcc

CFLAGS += -O3 -acc -Minfo=acc
LDFLAGS += -acc

CFLAGS += -ta=tesla,cc60

all: cpi

cpi_openacc.o: cpi_openacc.c
gettime.o: gettime.c

cpi: cpi_openacc.o gettime.o
	${CC} cpi_openacc.o gettime.o -o cpi ${LDFLAGS}
	mkdir -p build
	mv *.o ./build

clean:
	rm -f cpi *.o build/*
