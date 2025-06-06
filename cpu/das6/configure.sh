set -e
source das6/modules.sh
julia --project=. -e 'using Pkg; Pkg.instantiate()'
julia --project=. -e 'using MPIPreferences;use_system_binary(;force=true)'
julia --project=.  -e 'using Pkg; Pkg.precompile()'
julia --project=. -O3 --check-bounds=no -e 'using Pkg; Pkg.precompile()'
