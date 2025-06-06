# HelloMPI

Minimal Julia MPI application for testing purposes.

Usef for:
- Quickly check MPI when you move to a new system
- Check how mpi ranks are mapped to CPU cores
- Learn how to configure and use MPI on different systems
- Check the compilation and usage of a systemimage when using MPI

## Usage

Taking das6 as example https://www.cs.vu.nl/das/  

Without system image (default).

```batch
$ das6/configure.sh
$ sbatch das6/job.sh
```
With CUDA in gpu folder
```batch
$ sbatch snellius-2023/configure.sh
$ sbatch snellius-2023/job.sh
```

With system image (advanced).
```batch
$ das6/configure.sh
$ sbatch das6/compile.sh
# Wait for the previous job to finish
$ sbatch das6/job-with-sysimage.sh
```

