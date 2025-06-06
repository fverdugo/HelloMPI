#!/bin/bash
#SBATCH --partition=rome
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=6
#SBATCH --output=snellius-2023-job-with-sysimage.o
#SBATCH --error=snellius-2023-job-with-sysimage.e

source snellius-2023/modules.sh
export OMP_NUM_THREADS=1
export NUM_THREADS=1
SRUNFLAGS="--distribution=block --cpu-bind=rank"
JULIAFLAGS="-O3 --check-bounds=no -J HelloMPI.so"
srun -n 24 $SRUNFLAGS julia $JULIAFLAGS --project=. -e '
    using HelloMPI
    HelloMPI.greet()
'
