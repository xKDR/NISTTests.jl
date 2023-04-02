"""
```julia
wampler4_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Wampler4.shtml
"""

function wampler4_data(sink = DataFrame)
    get_nist_data(:Wampler4)
end

"""
```julia
wampler4_certified_values
```
NIST certified values for wampler4 dataset
"""
function wampler4_certified_values()
    NISTLREstimates(
        ones(6),
        [215232.62467817,236355.173469681,77934.3524331583,10147.550755035,564.566512170752,11.2324854679312],
        236014.502379268, 0.957478440825662)
end

"""
```julia
wampler4_model_formula
```
Formula of the model for this dataset
"""
wampler4_model_formula() = @formula(y ~ 1 + x + x^2 + x^3 + x^4 + x^5)


"""
```julia
wampler4_compare
```
Compare given estimates with certified estimates for Wampler4 dataset
"""
function wampler4_compare(beta, stderr, rsd, rsq)
    ct = wampler4_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

wampler4_model() = NISTLRModel(wampler4_data(), wampler4_model_formula(),
                             wampler4_certified_values(), true, :Wampler4)
