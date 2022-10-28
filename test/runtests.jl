using NISTTests
using Test

@testset "NISTTests.jl" begin
    include("load_data.jl")
    include("compare.jl")
    include("noint.jl")
    include("filip.jl")
    include("longley.jl")
    include("norris.jl")
    include("pontius.jl")
    include("wampler.jl")
    include("final_compare.jl")
    # Write your tests here.
end
