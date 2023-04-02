using NISTTests
using Test
using Distributions
using StatsModels
using GLM

@testset "NISTTests.jl" begin
    include("load_data.jl")
    include("compare.jl")
    include("filip.jl")
    include("longley.jl")
    include("noint.jl")
    include("norris.jl")
    include("pontius.jl")
    include("wampler.jl")
    # Write your tests here.
end

