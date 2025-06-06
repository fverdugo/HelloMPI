#!/bin/bash
#SBATCH --partition=rome
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --output=snellius-2023-compile.o
#SBATCH --error=snellius-2023-compile.e
set -e
source snellius-2023/modules.sh
julia --project=. -O3 --check-bounds=no --color=yes -e 'using Pkg; Pkg.instantiate()'
julia --project=. -O3 --check-bounds=no --color=yes compile/compile.jl
