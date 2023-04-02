# @test all(julia_compare(LinearModel,:Filip).precision["coef"] .> 11)
# @test all(julia_compare(LinearModel,:Filip).precision["stderror"] .> 11)
# @test julia_compare(LinearModel,:Filip).precision["dispersion"] > 11
# @test julia_compare(LinearModel,:Filip).precision["r2"] > 11