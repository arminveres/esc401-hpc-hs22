#!/bin/bash -l
#SBATCH --job-name=blurOpenacc
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=12
#SBATCH --partition=debug
#SBATCH --constraint=gpu
#SBATCH --account=uzg2
#SBATCH --error=error.log

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export CRAY_CUDA_MPS=1
N=$1
nstep=$2
module load \
	daint-gpu \
	craype-accel-nvidia60 \
	cudatoolkit
srun --output=output_"$N"_"$nstep".log ./blur.openacc "$N" "$nstep"
