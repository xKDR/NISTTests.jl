@test isa(julia_compare(LinearModel,:Wampler1),NISTTests.NISTLResults)
@test isa(julia_compare(LinearModel,:Wampler2),NISTTests.NISTLResults)
@test isa(julia_compare(LinearModel,:Wampler3),NISTTests.NISTLResults)
@test isa(julia_compare(LinearModel,:Wampler4),NISTTests.NISTLResults)
@test isa(julia_compare(LinearModel,:Wampler5),NISTTests.NISTLResults)


# @test all(julia_compare(LinearModel,:Wampler1).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:Wampler1).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:Wampler1).precision["dispersion"] > 11
# @test julia_compare(LinearModel,:Wampler1).precision["r2"] > 11