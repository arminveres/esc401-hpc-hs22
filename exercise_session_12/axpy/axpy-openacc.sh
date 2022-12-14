#!/bin/bash -l
#SBATCH --job-name=cpiopenacc
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=debug
#SBATCH --constraint=gpu
#SBATCH --account=uzg2
#SBATCH --output=output.log
#SBATCH --error=error.log

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export CRAY_CUDA_MPS=1
N=$1
module load daint-gpu
srun ./axpy.openacc "$N"
