using NISTTests
using Test

@testset "NISTTests.jl" begin
    include("load_data.jl")
    include("compare.jl")
    include("noint.jl")
    # Write your tests here.
end
