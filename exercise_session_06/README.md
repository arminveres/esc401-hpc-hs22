# Exercise 6

## Task 1

serial.c runs as well

## Task 3

Parallelizing only the first loop:

```
time ./nbody_omp

real	0m0.074s
user	0m11.129s
sys	0m0.024s
```

Parallelizing only the second loop:

```
time ./nbody_omp

real	0m18.459s
user	78m32.414s
sys	0m0.232s
```

Parallelizing both loops seems to be slightly slower than only the first loop:

```
time ./nbody_omp

real	0m0.079s
user	0m9.493s
sys	0m1.660s
```

- It makes most sense to parallelize the first loop, since the calculations are split into separate
  threads, but compared to the second loop being parallelized, the threads do not have to wait around
  as much and therefore the being much faster.

- Since it is a nested loop, one could expect a $O(N^2)$ scaling to the particles
