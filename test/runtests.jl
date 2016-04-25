using Base.Test

using RigidBodyDynamics
using Quaternions
using FixedSizeArrays

include("test_frames.jl")
test_frames()

include("test_spatial.jl")
test_spatial()

#run notebooks
using IJulia
jupyter = IJulia.jupyter
for f in filter(x -> endswith(x, "ipynb"), readdir("../examples"))
    notebook = "../examples/" * f
    run(`$jupyter nbconvert --to notebook --execute $notebook --output $notebook`)
end
