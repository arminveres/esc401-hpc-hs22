# Exercise 11

## OpenACC cpi

First I didn't even saw in the Exercise, that the mpich error was meant to be, so I aliased cc=pgcc, and the error
disappeared.
Following were the run times:
```
PI = 3.141592653589793 computed in 0.4486 seconds
PI = 3.141592653589793 computed in 0.01414 seconds
PI = 3.141592653589793 computed in 0.01411 seconds
PI = 3.141592653589793 computed in 0.0141 seconds
PI = 3.141592653589793 computed in 0.01408 seconds


Batch Job Summary Report (version 21.01.1) for Job "cpiopenacc" (43357105) on daint

Job information (1/2)
-----------------------------------------------------------------------------------------------------
             Submit            Eligible               Start                 End    Elapsed Time limit
------------------- ------------------- ------------------- ------------------- ---------- ----------
2022-12-07T18:24:12 2022-12-07T18:24:12 2022-12-07T18:24:15 2022-12-07T18:24:32   00:00:17   00:05:00
-----------------------------------------------------------------------------------------------------

Job information (2/2)
-------------------------------------------------------------
    Username      Account    Partition   NNodes        Energy
------------ ------------ ------------ -------- -------------
      averes         uzg2        debug        1      0.640 kJ
```

Now running with the downgraded mpich:
```
PI = 3.141592653589793 computed in 0.4431 seconds
PI = 3.141592653589793 computed in 0.01413 seconds
PI = 3.141592653589793 computed in 0.0141 seconds
PI = 3.141592653589793 computed in 0.01409 seconds
PI = 3.141592653589793 computed in 0.01408 seconds


Batch Job Summary Report (version 21.01.1) for Job "cpiopenacc" (43357369) on daint

Job information (1/2)
-----------------------------------------------------------------------------------------------------
             Submit            Eligible               Start                 End    Elapsed Time limit
------------------- ------------------- ------------------- ------------------- ---------- ----------
2022-12-07T18:35:40 2022-12-07T18:35:40 2022-12-07T18:35:42 2022-12-07T18:35:49   00:00:07   00:05:00
-----------------------------------------------------------------------------------------------------

Job information (2/2)
-------------------------------------------------------------
    Username      Account    Partition   NNodes        Energy
------------ ------------ ------------ -------- -------------
      averes         uzg2        debug        1      0.323 kJ
```
So pretty much the same, though the first iteration in each case, needs extra time, to set up the variable and memory,
leading to a 3x higher time to execute. After that since all is setup, it runs faster.

## Task 2: Cuda

The task runs only once and takes
```
PI = 3.14159265358979 computed in 0.08552 seconds


Batch Job Summary Report (version 21.01.1) for Job "cpiopenacc" (43357532) on daint

Job information (1/2)
-----------------------------------------------------------------------------------------------------
             Submit            Eligible               Start                 End    Elapsed Time limit
------------------- ------------------- ------------------- ------------------- ---------- ----------
2022-12-07T18:44:30 2022-12-07T18:44:30 2022-12-07T18:44:31 2022-12-07T18:44:58   00:00:27   00:05:00
-----------------------------------------------------------------------------------------------------

Job information (2/2)
-------------------------------------------------------------
    Username      Account    Partition   NNodes        Energy
------------ ------------ ------------ -------- -------------
      averes         uzg2        debug        1      1.256 kJ
```
Which is half as much as the first round with setup of openacc.
This is probably due to cuda being faster, because one can allocate thing more precisely and leave less
