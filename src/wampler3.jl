
"""
```julia
wampler3_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Wampler3.shtml
"""

function wampler3_data(sink = DataFrame)
    get_nist_data(:Wampler3)
end

"""
```julia
wampler3_certified_values
```
NIST certified values for wampler3 dataset
"""
function wampler3_certified_values()
    NISTLREstimates(
        ones(6),
        [2152.3262467817,2363.55173469681,779.343524331583,101.47550755035,5.64566512170752,0.112324854679312],
        2360.14502379268, 0.999995559025820)
end

"""
```julia
wampler3_model_formula
```
Formula of the model for this dataset
"""
wampler3_model_formula() = @formula(y ~ 1 + x + x^2 + x^3 + x^4 + x^5)


"""
```julia
wampler3_compare
```
Compare given estimates with certified estimates for Wampler3 dataset
"""
function wampler3_compare(beta, stderr, rsd, rsq)
    ct = wampler3_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

wampler3_model() = NISTLRModel(wampler3_data(), wampler3_model_formula(),
                             wampler3_certified_values(), true, :Wampler3)
