
"""
```julia
wampler1_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Wampler1.shtml
"""

function wampler1_data(sink = DataFrame)
    get_nist_data(:Wampler1)
end

"""
```julia
wampler1_certified_values
```
NIST certified values for wampler1 dataset
"""
function wampler1_certified_values()
    NISTLREstimates(
        ones(6),
        zeros(6),
        0, 1)
end

"""
```julia
wampler1_model_formula
```
Formula of the model for this dataset
"""
wampler1_model_formula() = @formula(y ~ 1 + x + x^2 + x^3 + x^4 + x^5)


"""
```julia
wampler1_compare
```
Compare given estimates with certified estimates for Wampler1 dataset
"""
function wampler1_compare(beta, stderr, rsd, rsq)
    ct = wampler1_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

wampler1_model() = NISTLRModel(wampler1_data(), wampler1_model_formula(),
                             wampler1_certified_values(), true, :Wampler1)
