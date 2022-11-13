#!/bin/bash -e

for N in 1 4 16 36; do
	for G in 128 256 512 1024; do
		echo "Running on $N Threads/Processes with $G^2 grid size"
		sed -i "s/nx=[0-9]*/nx=$G/g" params.txt
		sed -i "s/ny=[0-9]*/ny=$G/g" params.txt
		sbatch \
			--output=./output/timed_mpi_${N}_${G}.out \
			--error=./output/timed_mpi_${N}_${G}.err \
			timed-mpi.job ${N}
#		sleep 10
#		sbatch \
#			--output=./output/timed_omp_${N}_${G}.out \
#			--error=./output/timed_omp_${N}_${G}.err \
#			timed-omp.job ${N}
		sleep 10
	done
done
