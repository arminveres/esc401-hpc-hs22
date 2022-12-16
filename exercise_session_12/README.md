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

## blur

The naive method requires lots of copying, multiple times, while in the other version, we can just let it
copy once and parallelize the inner loops.
We also need to beware of calling other methods inside such parallel regions, which is why we need to
serialize/sequentialize it.

### Naive

After struggling to make the programs run correctly:

```bash
module load \
    cudatoolkit \
    daint-gpu \
    craype-accel-nvidia60
module switch \
    PrgEnv-cray/6.0.10 \
    PrgEnv-pgi/6.0.8
```

I decided to let each task run twice on a node with following results:

#### n=10,nsteps=10

```
dispersion 1D test of length n = 1028 : 0.00784302MB
==== success ====
Host version took 4.1008e-05 s (4.1008e-06 s/step)
GPU version took 0.00107312 s (0.000107312 s/step)
dispersion 1D test of length n = 1028 : 0.00784302MB
==== success ====
Host version took 4.1008e-05 s (4.1008e-06 s/step)
GPU version took 0.00165796 s (0.000165796 s/step)
```

#### n=20,nsteps=50

```
dispersion 1D test of length n = 1048580 : 8.00003MB
==== success ====
Host version took 0.110403 s (0.00220806 s/step)
GPU version took 0.279602 s (0.00559204 s/step)
dispersion 1D test of length n = 1048580 : 8.00003MB
==== success ====
Host version took 0.112235 s (0.0022447 s/step)
GPU version took 0.197766 s (0.00395532 s/step)
```

#### n=25,nsteps=50

```
dispersion 1D test of length n = 33554436 : 256MB
==== success ====
Host version took 6.16937 s (0.123387 s/step)
GPU version took 7.15564 s (0.143113 s/step)
dispersion 1D test of length n = 33554436 : 256MB
==== success ====
Host version took 6.05819 s (0.121164 s/step)
GPU version took 7.15268 s (0.143054 s/step)
```

The gpu version takes around 10 percent more time to process

### no copies

The no multi copy version is way faster, sinve it has to only allocate memory in each call once.

#### n=10,nsteps=10

```
dispersion 1D test of length n = 1028 : 0.00784302MB
==== success ====
Host version took 4.19617e-05 s (4.19617e-06 s/step)
GPU version took 0.000620127 s (6.20127e-05 s/step)
dispersion 1D test of length n = 1028 : 0.00784302MB
==== success ====
Host version took 4.19617e-05 s (4.19617e-06 s/step)
GPU version took 0.001333 s (0.0001333 s/step)
```

#### n=20,nsteps=50

```
dispersion 1D test of length n = 1048580 : 8.00003MB
==== success ====
Host version took 0.105809 s (0.00211618 s/step)
GPU version took 0.0949712 s (0.00189942 s/step)
dispersion 1D test of length n = 1048580 : 8.00003MB
==== success ====
Host version took 0.108335 s (0.0021667 s/step)
GPU version took 0.0170772 s (0.000341544 s/step)
```

#### n=25,nsteps=50

We see, that especially here, we have an immense speedup: 24x

```
dispersion 1D test of length n = 33554436 : 256MB
==== success ====
Host version took 6.23267 s (0.124653 s/step)
GPU version took 0.243638 s (0.00487276 s/step)
dispersion 1D test of length n = 33554436 : 256MB
==== success ====
Host version took 6.24244 s (0.124849 s/step)
GPU version took 0.263418 s (0.00526836 s/step)
```

## Task 3: dot

This task takes longer to run on the cpu, probably because of all the copying and also the reduction takes
its toll on the performance, needing to reduce all the results from each of the streaming cores.

### n=10

```
dot product OpenACC of length n = 1024 : 0.0078125MB
expected 9286 got 9286: success
Host kernel took 0 s
GPU kernel took 0.018204 s
```

### n=20

```
dot product OpenACC of length n = 1048576 : 8MB
expected 9.44282e+06 got 9.44282e+06: success
Host kernel took 0.000828028 s
GPU kernel took 0.0202448 s
```

### n=30

```

dot product OpenACC of length n = 33554432 : 256MB
expected 3.0201e+08 got 3.0201e+08: success
Host kernel took 0.032593 s
GPU kernel took 0.0629818 s
```
