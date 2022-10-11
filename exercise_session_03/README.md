# Exercise Session 03

In this session, you will work on modularization of the code and compilation optimization. Moreover, you will parallelize a simple code and successively plot its speedup.

In this folder you can find:

- cpi.c : the serial version of last week parallel code, needed for Exercise 1
- cpi_mpi.c : the MPI version of cpi code, for Exercise 1
- sum.c : the code needed for Exercise 2

## Task 1

Serial CPI:

```
pi is approximately 3.1415926555899709, Error is 0.0000000020001778
Computed in 3.34 seconds
```

MPI CPI:

```
Process rank: 0
pi is approximately 3.1415926555899709, Error is 0.0000000020001778
Computed in 3.519 seconds
Gettime elapsed execution time: 3.5204
```

Difference serial vs mpi:
The difference must stem from the extra MPI Function calls.

Difference mpi timer and gettime:
Our timer starts counting from before the call of the MPI init functions and ends after the mpi timer.
The difference also is less than 10ms

## Task 2

### Flag comparisons

Sum with -O0:

```
sum=10022429073.341873
Elapsed Time: 5.9939
```

Sum with -O1:

```
sum=10022429073.341873
Elapsed Time: 1.1570
```

Sum with -O2:

```
sum=10022429073.341873
Elapsed Time: 1.0754
```

Sum with -O3:

```
sum=10022429073.341873
Elapsed Time: 1.0804
```

Sum with -O3 -ffast-math -mavx2:

```
sum=10022429073.341873
Elapsed Time: 1.2028
```

An alternative timing would be `clock()`, which the number of clock ticks per second, which we could
then subtract, just like we do at a later point.

The biggest jump in reduction of execution time is from O0 to O1, which is 3.85s.

The compiler e.g. inlines code and variables, reducing the need to call them. There are vast amounts of
optimization the compiler can do. That results in a harder time debugging, since variables get inlined
and we can't track them anymore.

Using `-ffast-math and -mavx2 -O3` didn't not reduce, but increased execution time back to around
levels of O1, which I did not think to happen.

### omp parallel

The header is "omp.h" and I inserted the pragma statement just above the for loop.
I needed to add -fopenmp as and both CFLAGS and LDFLAGS.
