using PackageCompiler

create_sysimage([:HelloMPI,:MPI],
  sysimage_path="HelloMPI.so",
  precompile_execution_file=joinpath(@__DIR__,"warmup.jl"),
  include_transitive_dependencies = false,
  sysimage_build_args = `--check-bounds=no -O3`,
 )

