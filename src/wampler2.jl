"""
```julia
wampler2_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Wampler2.shtml
"""

function wampler2_data(sink = DataFrame)
    get_nist_data(:Wampler2)
end

"""
```julia
wampler2_certified_values
```
NIST certified values for wampler2 dataset
"""
function wampler2_certified_values()
    NISTLREstimates(
        ones(6) ./ [1, 10, 100, 1000, 10000, 100000],
        zeros(6),
        0, 1)
end

"""
```julia
wampler2_model_formula
```
Formula of the model for this dataset
"""
wampler2_model_formula() = @formula(y ~ 1 + x + x^2 + x^3 + x^4 + x^5)


"""
```julia
wampler2_compare
```
Compare given estimates with certified estimates for Wampler2 dataset
"""
function wampler2_compare(beta, stderr, rsd, rsq)
    ct = wampler2_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

wampler2_model() = NISTLRModel(wampler2_data(), wampler2_model_formula(),
                             wampler2_certified_values(), true, :Wampler2)
