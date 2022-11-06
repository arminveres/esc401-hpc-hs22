CFLAGS=-O3 -ffast-math -mavx2

outputs:= pi
all: ${outputs} move

pi: pi.c

move:
	mv ${outputs} build/
clean:
	rm -f build/${outputs}
coms:
	compiledb make all
