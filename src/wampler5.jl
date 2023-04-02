"""
```julia
wampler5_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Wampler5.shtml
"""

function wampler5_data(sink = DataFrame)
    get_nist_data(:Wampler5)
end

"""
```julia
wampler5_certified_values
```
NIST certified values for wampler5 dataset
"""
function wampler5_certified_values()
    NISTLREstimates(
        ones(6),
        [21523262.467817,23635517.3469681,7793435.24331583,1014755.0755035,56456.6512170752,1123.24854679312],
        23601450.2379268, 0.224668921574940E-02)
end

"""
```julia
wampler5_model_formula
```
Formula of the model for this dataset
"""
wampler5_model_formula() = @formula(y ~ 1 + x + x^2 + x^3 + x^4 + x^5)


"""
```julia
wampler5_compare
```
Compare given estimates with certified estimates for Wampler5 dataset
"""
function wampler5_compare(beta, stderr, rsd, rsq)
    ct = wampler5_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

wampler5_model() = NISTLRModel(wampler5_data(), wampler5_model_formula(),
                             wampler5_certified_values(), true, :Wampler5)
