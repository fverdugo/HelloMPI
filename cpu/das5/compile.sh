#!/bin/bash
#SBATCH --time=00:15:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --output=das5-compile.o
#SBATCH --error=das5-compile.e
set -e
source das5/modules.sh
julia --project=. -O3 --check-bounds=no --color=yes -e 'using Pkg; Pkg.instantiate()'
julia --project=. -O3 --check-bounds=no --color=yes compile/compile.jl
