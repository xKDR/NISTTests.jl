"""
```julia
longley_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Longley.shtml
"""

function longley_data(sink = DataFrame)
    get_nist_data(:Longley)
end

"""
```julia
longley_certified_values
```
NIST certified values for longley dataset
"""
function longley_certified_values()
    NISTLREstimates(
        [-3482258.63459582,15.0618722713733,-0.035819179292591,-2.02022980381683,-1.03322686717359,-0.0511041056535807],
        [890420.383607373,84.9149257747669,0.0334910077722432,0.488399681651699,0.214274163161675,0.22607320006937],
        304.854073561965, 0.995479004577296)
end

"""
```julia
longley_model_formula
```
Formula of the model for this dataset
"""
longley_model_formula() = @formula(y ~ 1 + x1 + x2 + x3 + x4 + x5 + x6)


"""
```julia
longley_compare
```
Compare given estimates with certified estimates for Longley dataset
"""
function longley_compare(beta, stderr, rsd, rsq)
    ct = longley_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

longley_model() = NISTLRModel(longley_data(), longley_model_formula(),
                             longley_certified_values(), true, :Longley)
