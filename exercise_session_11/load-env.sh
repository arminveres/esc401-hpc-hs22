#!/bin/bash -e

module load daint-gpu
sleep 1
module load cudatoolkit
sleep 1
module load craype-accel-nvidia60
sleep 1
module swap PrgEnv-cray PrgEnv-pgi
