#!/bin/bash
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=6
#SBATCH --output=das5-job.o
#SBATCH --error=das5-job.e

source das5/modules.sh
export OMP_NUM_THREADS=1
export NUM_THREADS=1
MPIFLAGS="--map-by node:span --rank-by core"
JULIAFLAGS="-O3 --check-bounds=no"
mpiexec -np 24 $MPIFLAGS julia $JULIAFLAGS --project=. -e '
    using HelloMPI
    HelloMPI.greet()
'
