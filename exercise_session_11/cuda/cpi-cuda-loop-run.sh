#!/bin/bash -l
#SBATCH --job-name=cpicuda
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=debug
#SBATCH --constraint=gpu
#SBATCH --account=uzg2
#SBATCH --output=output-loop.log
#SBATCH --error=error-loop.log

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export CRAY_CUDA_MPS=1
module load daint-gpu
srun ./loop_cpi
