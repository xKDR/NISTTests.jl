@test isa(julia_compare(LinearModel,:Pontius),NISTTests.NISTLResults)

# @test all(julia_compare(LinearModel,:Pontius).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:Pontius).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:Pontius).precision["dispersion"] > 11
# @test julia_compare(LinearModel,:Pontius).precision["r2"] > 11