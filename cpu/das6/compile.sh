#!/bin/bash
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=das6-compile.o
#SBATCH --error=das6-compile.e
set -e
source das6/modules.sh
julia --project=. -O3 --check-bounds=no --color=yes -e 'using Pkg; Pkg.instantiate()'
julia --project=. -O3 --check-bounds=no --color=yes compile/compile.jl
