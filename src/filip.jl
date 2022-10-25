"""
```julia
julia_summary_filip
```

Uses `julia` to calculate datas for Filip.
"""
function julia_summary_filip(filename)
    nist_d=get_nist_data(filename)
    fm=@formula(y~ x1+x1^2+x1^3+x1^4+x1^5+x1^6+x1^7+x1^8+x1^9+x1^10)
    jlm=lm(fm, nist_d)
    jbeta= coef(jlm)
    jse = stderror(jlm)
    jrsd = GLM.dispersion(jlm.model)
    jrsq=r2(jlm)
    return jbeta, jse, jrsd,jrsq
end

"""
```julia
R_summary_filip
```

Uses `R` to calculate datas for Filip.
"""

function R_summary_filip(filename)

    nist_ddata=get_nist_data(filename)

    @rput nist_ddata
    R"""
    options(digits=16)
    rlm = lm(y ~ x1 + I(x1^2)+ I(x1^3)+ I(x1^4)+ I(x1^5)+ I(x1^6)+ I(x1^7)+ I(x1^8)+ I(x1^9)+ I(x1^10), data = nist_ddata)
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
full_filip
```

Uses `julia` and `R` to calculate datas for Filip Dataset and displays them with actual NIST-Datasets.
"""

function full_filip(filename)    
    nist_beta=[]
    for i in range(1,11)
        append!(nist_beta,get_nist_beta(filename,i))
    end
    
    nist_se=[]
    for i in range(1,11)
        append!(nist_se,get_nist_standarderror(filename,i))
    end
    
    nist_rsd=get_nist_rsd(filename)
    nist_rsquare=get_nist_rsquare(filename)
    
    j_l=julia_summary_filip(filename)
    r_l=R_summary_filip(filename)

    df = DataFrame("NIST-Beta"=>nist_beta, "R-Beta"=>r_l[1], "Julia-Beta"=>j_l[1], 
    "NIST-SE"=>nist_se, "R-SE" => r_l[2], "Julia-SE" => j_l[2], 
    "NIST-RSD"=>nist_rsd, "R-RSD"=>r_l[3], "Julia-RSD"=>j_l[3], 
    "NIST-RSquare"=>nist_rsquare, "R-RSquare"=>r_l[4], "Julia-RSquare"=>j_l[4])
    
end

"""
```julia
full_compare_filip
```

Uses `julia` and `R` to calculate datas for Filip Dataset and compares them with actual NIST-Datasets and display.
"""

function full_compare_filip(filename)
    nist_beta=[]
    nist_se=[]
    for i in range(1,11)
        append!(nist_beta,float(get_nist_beta(filename,i)))
        append!(nist_se,float(get_nist_standarderror(filename,i)))
    end
    
    
    j_l=julia_summary_filip(filename)
    r_l=R_summary_filip(filename)
    
    
    j_beta=[]
    j_se=[]
    r_beta=[]
    r_se=[]
    for i in range(1,11)
        append!(j_beta,compare_nist_beta(filename,i,float(j_l[1][i])))
        append!(j_se,compare_nist_standarderror(filename,i,j_l[2][i]))
        if(i<11)
            append!(r_beta,compare_nist_beta(filename,i,r_l[1][i]))
            append!(r_se,compare_nist_standarderror(filename,i,r_l[2][i]))
        end
    end
    
    append!(r_beta,string(0))
    append!(r_se,0)
    r_beta[11]="NaN"
    r_se[11]="NaN"
    
    nist_rsd=get_nist_rsd(filename)
    nist_rsquare=get_nist_rsquare(filename)
    
    df = DataFrame("NIST-Beta"=>nist_beta, "R-Beta Com"=>r_beta, "Julia-Beta Com"=>j_beta, 
    "NIST-SE"=>nist_se, "R-SE Com" => r_se, "Julia-SE Com" => j_se, 
    "NIST-RSD"=>nist_rsd, "R-RSD Com"=>compare_nist_rsd(filename,r_l[3]), "Julia-RSD Com"=>compare_nist_rsd(filename,j_l[3]), 
    "NIST-RSquare"=>nist_rsquare, "R-RSquare Com"=>compare_nist_rsquare(filename,r_l[4]), "Julia-RSquare Com"=>compare_nist_rsquare(filename,j_l[4]))
    
end