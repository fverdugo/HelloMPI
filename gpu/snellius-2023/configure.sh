#!/bin/bash
#SBATCH --partition=gpu_a100
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --error=snellius-2025-configure.e
#SBATCH --output=snellius-2025-configure.o

set -e
source snellius-2023/modules.sh

julia --project=. -e 'using Pkg;Pkg.resolve();Pkg.instantiate()'
julia --project=. -e 'using MPIPreferences;use_system_binary(;force=true)'
julia --project=. -e 'using CUDA; CUDA.set_runtime_version!(local_toolkit=true)'
julia --project=.  -e 'using Pkg; Pkg.precompile()'
julia --project=. -O3 --check-bounds=no -e 'using Pkg; Pkg.precompile()'
