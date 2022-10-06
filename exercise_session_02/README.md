# Exercise Session 02 #
In this session, you will compile and run your first programs on Eiger. This directory contains two versions of the code that were parallelized using MPI or OpenMP.

## Task 2:
Prenv: I am using PrgEnv-cray by default.
`module list` lists all the enabled modules
`module avail` lists the available modules
`module spider` also lists the available modules but given a keyword it can search for that

## Task 3:
To get the requested squeue fields I would use the following formatting:
`squeue -o "%i %u %p %a %j %D %t %r %S %L %p"`
