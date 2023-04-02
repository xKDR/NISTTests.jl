@test isa(julia_compare(LinearModel,:NoInt1),NISTTests.NISTLResults)
@test isa(julia_compare(LinearModel,:NoInt2),NISTTests.NISTLResults)

# @test all(julia_compare(LinearModel,:NoInt1).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:NoInt1).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:NoInt1).precision["dispersion"] > 11
# @test julia_compare(LinearModel,:NoInt1).precision["r2"] > 11

# @test all(julia_compare(LinearModel,:NoInt2).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:NoInt2).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:NoInt2).precision["dispersion"] > 11
# @test julia_compare(LinearModel,:NoInt2).precision["r2"] > 11