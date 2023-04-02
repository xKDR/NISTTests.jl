@test isa(julia_compare(LinearModel,:Norris),NISTTests.NISTLResults)

# @test all(julia_compare(LinearModel,:Norris).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:Norris).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:Norris).precision["dispersion"] > 11
# @test julia_compare(LinearModel,:Norris).precision["r2"] > 11