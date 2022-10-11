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
