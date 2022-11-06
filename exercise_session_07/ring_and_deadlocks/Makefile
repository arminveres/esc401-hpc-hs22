CFLAGS=-O3 -ffast-math -mavx2

outputs:= ring split_ring nb_ring
all: ${outputs} move

ring: ring.c
split_ring: split_ring.c
nb_ring: nb_ring.c

move:
	mv ${outputs} build/
clean:
	rm -f build/${outputs}
coms:
	compiledb make all
