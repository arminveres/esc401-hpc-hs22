# Exercise 12

## axpy

openacc is around 1.5x faster than openmp, for N == 1:
```
memcopy and daxpy test of size 1
-------
timings
-------
axpy (openmp): 1.0366e-05 s
axpy (openacc): 7.553e-06 s

============ PASSED
```
N==20, 1.6x faster:
```
memcopy and daxpy test of size 1048576
-------
timings
-------
axpy (openmp): 0.000672123 s
axpy (openacc): 0.00113328 s

============ PASSED
```
N==30
```
memcopy and daxpy test of size 1073741824
-------
timings
-------
axpy (openmp): 1.36666 s
axpy (openacc): 1.33094 s
```
which is only 30ms faster, probably due to the amount of sheer copying, with
$$2^{30}$$
entries.
