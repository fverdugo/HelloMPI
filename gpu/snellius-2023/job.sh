#!/bin/bash
#SBATCH --partition=gpu_a100
#SBATCH --time=00:10:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1
#SBATCH --output=snellius-2023-job.o
#SBATCH --error=snellius-2023-job.e

source snellius-2023/modules.sh
export OMP_NUM_THREADS=1
export NUM_THREADS=1
SRUNFLAGS="--distribution=block"
JULIAFLAGS="-O3 --check-bounds=no"
srun -n 8 $SRUNFLAGS julia $JULIAFLAGS --project=. -e '
    using HelloMPICUDA
    HelloMPICUDA.greet()
'

