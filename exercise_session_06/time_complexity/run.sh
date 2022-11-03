#!/bin/bash -l

for N in 100 500 1000 5000 10000 20000 30000 40000 50000 60000 75000; do
	sbatch --output=./output/scaling_nbody_serial_${N}.out run_nbody_serial.job ${N}
	sleep 20
	sbatch --output=./output/scaling_nbody_omp_${N}.out run_nbody_omp.job ${N}
	sleep 20
done
