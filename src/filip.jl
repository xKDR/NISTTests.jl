
"""
```julia
filip_data
```

https://www.itl.nist.gov/div898/strd/lls/data/Filip.shtml
"""

function filip_data(sink = DataFrame)
    get_nist_data(:Filip)
end

"""
```julia
filip_certified_values
```
NIST certified values for filip dataset
"""
function filip_certified_values()
    NISTLREstimates(
        [-1467.4896142298,-2772.17959193342,-2316.37108160893,-1127.97394098372,-354.478233703349,-75.1242017393757,-10.8753180355343,-1.06221498588947,-0.0670191154593408,-0.00246781078275479,-4.02962525080404E-05],
        [298.084530995537,559.77986547495,466.477572127796,227.204274477751,71.6478660875927,15.28971787474,2.23691159816033,0.221624321934227,0.0142363763154724,0.000535617408889821,8.96632837373868E-06],
        0.334801051324544E-02, 0.996727416185620)
end

"""
```julia
filip_model_formula
```
Formula of the model for this dataset
"""
filip_model_formula() = @formula(y ~ 1 + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10)


"""
```julia
filip_compare
```
Compare given estimates with certified estimates for Filip dataset
"""
function filip_compare(beta, stderr, rsd, rsq)
    ct = filip_model()
    compare(ct, float(beta), float(stderr), float(rsd), float(rsq))
end

filip_model() = NISTLRModel(filip_data(), filip_model_formula(),
                             filip_certified_values(), true, :Filip)