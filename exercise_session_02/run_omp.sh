#!/bin/bash -l
#SBATCH --job-name="omp"
#SBATCH --account="project"
#SBATCH --time=00:05:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=arminrichard.veres@uzh.ch
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=128
#SBATCH --partition=debug
#SBATCH --constraint=mc
#SBATCH --hint=nomultithread
#SBATCH --account=uzh8
#SBATCH --output=run_omp.log
#SBATCH --error=errors_omp.log

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun $HOME/hpc_esc_401/exercise_session_02/cpi_omp
srun $HOME/hpc_esc_401/exercise_session_02/cpi_mpi
