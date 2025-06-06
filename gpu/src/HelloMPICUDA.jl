module HelloMPICUDA

using MPI
using CUDA

function greet()
    if ! MPI.Initialized()
        MPI.Init()
    end
    comm = MPI.COMM_WORLD
    host = gethostname()
    cpu = @ccall sched_getcpu()::Cint
    gpu = read(`nvidia-smi -L`, String)
    root = 0
    cpus = MPI.gather(cpu,comm;root)
    gpus = MPI.gather(gpu,comm;root)
    ranks = MPI.gather(MPI.Comm_rank(comm),comm;root)
    names = MPI.gather(host,comm;root)
    if MPI.Comm_rank(comm) == root
        for (rank,name,core,gpu) in zip(ranks,names,cpus,gpus)
            
            println("$(name): I am $(rank) of $(MPI.Comm_size(comm)) in cpu $core with gpu $(gpu)")
        end
    end
    MPI.Barrier(comm)
end

end # module
