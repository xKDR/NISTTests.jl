"""
```julia
julia_summary_noint
```

Uses `julia` to calculate datas for NoInt1 and NoInt2 Datasets.
"""
function julia_summary_noint(filename)
    nist_d=get_nist_data(filename)
    jlm=lm(@formula(y~ 0 + x), nist_d)
    jbeta= coef(jlm)
    jse = stderror(jlm)
    jrsd = GLM.dispersion(jlm.model)
    jrsq=r2(jlm)
    return jbeta, jse, jrsd, jrsq
end

"""
```julia
R_summary_noint
```

Uses `R` to calculate datas for NoInt1 and NoInt2 Datasets.
"""
function R_summary_noint(filename)

    nist_ddata=get_nist_data(filename)

    @rput nist_ddata
    R"""
    options(digits=16)
    rlm = lm(y ~ 0+x, data = nist_ddata)
    rbeta = coef(rlm)
    rse = sqrt(diag(vcov(rlm)))
    rrse = sigma(rlm)
    rrsq = summary(rlm)$r.squared
    """
    @rget rbeta
    @rget rse
    @rget rrse
    @rget rrsq

    return(rbeta,rse,rrse,rrsq)
end

"""
```julia
full_noint
```

Uses `julia` and `R` to calculate datas for NoInt1 and NoInt2 Datasets and displays them with actual NIST-Datasets.
"""
function full_noint(filename)
    nist_l=(get_nist_beta(filename,1),get_nist_standarderror(filename,1),get_nist_rsd(filename),get_nist_rsquare(filename))
    j_l=julia_summary_noint(filename)
    r_l=R_summary_noint(filename)
    df = DataFrame("NIST-Beta"=>nist_l[1], "R-Beta"=>r_l[1], "Julia-Beta"=>j_l[1][1], 
    "NIST-SE"=>nist_l[2], "R-SE" => r_l[2], "Julia-SE" => j_l[2][1], 
    "NIST-RSD"=>nist_l[3], "R-RSD"=>r_l[3], "Julia-RSD"=>j_l[3], 
    "NIST-RSquare"=>nist_l[4], "R-RSquare"=>r_l[4], "Julia-RSquare"=>j_l[4])
    
end

"""
```julia
full_compare_noint
```

Uses `julia` and `R` to calculate datas for NoInt1 and NoInt2 Datasets and compares them with actual NIST-Datasets and display.
"""
function full_compare_noint(filename)
    nist_l=(get_nist_beta(filename,1),get_nist_standarderror(filename,1),get_nist_rsd(filename),get_nist_rsquare(filename))
    j_l=julia_summary_noint(filename)
    r_l=R_summary_noint(filename)
    df = DataFrame("NIST-Beta"=>nist_l[1], "R-Beta Com"=>compare_nist_beta(filename,1,r_l[1]), "Julia-Beta Com"=>compare_nist_beta(filename,1,j_l[1][1]), 
    "NIST-SE"=>nist_l[2], "R-SE Com" => compare_nist_standarderror(filename,1,r_l[2]), "Julia-SE Com" => compare_nist_standarderror(filename,1,j_l[2][1]), 
    "NIST-RSD"=>nist_l[3], "R-RSD Com"=>compare_nist_rsd(filename,r_l[3]), "Julia-RSD Com"=>compare_nist_rsd(filename,j_l[3]), 
    "NIST-RSquare"=>nist_l[4], "R-RSquare Com"=>compare_nist_rsquare(filename,r_l[4]), "Julia-RSquare Com"=>compare_nist_rsquare(filename,j_l[4]))
    
end