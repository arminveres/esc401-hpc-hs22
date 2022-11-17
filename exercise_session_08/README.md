# Exercise 8

## Speedup

I tried to plot the datapoints with python, though for some reason I did not manage to correctly sort
them, therefore I am just uploading the datapoint omp.dat and mpi.dat

Weirldy enough, the timing has been utterly unstable, leading to no information gains out of the plots
anyway.

some of the MPI runs took so long, that it overran the 15 limit mark I set it to.

## Perftools

- No output noticed while compiling:
```
$ make
g++ -O -g -ffast-math    nbody.cpp   -o nbody
```
I was also not able to make it produce any cray output.
I loaded perftools-lite, tried different prgenvs to no avail.
