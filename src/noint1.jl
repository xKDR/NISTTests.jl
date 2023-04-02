"""
```julia
noint1_data
```

https://www.itl.nist.gov/div898/strd/lls/data/NoInt1.shtml
"""

function noint1_data(sink = DataFrame)
    get_nist_data(:NoInt1)
end

"""
```julia
noint1_certified_values
```
NIST certified values for noint1 dataset
"""
function noint1_certified_values()
    NISTLREstimates(
        [2.07438016528926],
        [0.165289256198347E-01],
        3.56753034006338, 0.999365492298663)
end

"""
```julia
noint1_model_formula
```
Formula of the model for this dataset
"""
noint1_model_formula() = @formula(y ~ 0 + x)


"""
```julia
noint1_compare
```
Compare given estimates with certified estimates for NoInt1 dataset
"""
function noint1_compare(beta, stderr, rsd, rsq)
    ct = noint1_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

noint1_model() = NISTLRModel(noint1_data(), noint1_model_formula(),
                             noint1_certified_values(), true, :NoInt1)
