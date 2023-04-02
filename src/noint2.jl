"""
```julia
noint2_data
```

https://www.itl.nist.gov/div898/strd/lls/data/NoInt2.shtml
"""

function noint2_data(sink = DataFrame)
    get_nist_data(:NoInt2)
end

"""
```julia
noint2_certified_values
```
NIST certified values for noint2 dataset
"""
function noint2_certified_values()
    NISTLREstimates(
        [0.727272727272727],
        [0.420827318078432E-01],
        0.369274472937998, 0.993348115299335)
end

"""
```julia
noint2_model_formula
```
Formula of the model for this dataset
"""
noint2_model_formula() = @formula(y ~ 0 + x)


"""
```julia
noint2_compare
```
Compare given estimates with certified estimates for NoInt2 dataset
"""
function noint2_compare(beta, stderr, rsd, rsq)
    ct = noint2_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

noint2_model() = NISTLRModel(noint2_data(), noint2_model_formula(),
                             noint2_certified_values(), true, :NoInt2)
