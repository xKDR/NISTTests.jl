# @test all(julia_compare(LinearModel,:Longley).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:Longley).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:Longley).precision["r2"] > 11
# @test julia_compare(LinearModel,:Longley).precision["r2"] > 11
@test isa(julia_compare(LinearModel,:Longley),NISTTests.NISTLResults)