module HelloMPI

using MPI

function greet()
    if ! MPI.Initialized()
        MPI.Init()
    end
    comm = MPI.COMM_WORLD
    host = gethostname()
    cpu = @ccall sched_getcpu()::Cint
    root = 0
    cpus = MPI.gather(cpu,comm;root)
    ranks = MPI.gather(MPI.Comm_rank(comm),comm;root)
    names = MPI.gather(host,comm;root)
    if MPI.Comm_rank(comm) == root
        for (rank,name,core) in zip(ranks,names,cpus)
            println("$(name): I am $(rank) of $(MPI.Comm_size(comm)) in cpu $core")
        end
    end
    MPI.Barrier(comm)
end

end # module
