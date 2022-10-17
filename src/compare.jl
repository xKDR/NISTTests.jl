"""
```julia
how_same
```
A function to check how close two numbers are. 
"""

function how_same(x, y)
    x=abs(x)
    y=abs(y)
    if(x*y==0)
        return 0
    else
        ans=0
        for prec in 15:-1:1
            tst = isapprox(x, y, atol=10.0^(-prec))
            #println(prec," ", tst)
            if(tst)
                ans=prec
                break
            end
        end
        
        return ans
    end
end


"""
```julia
compare_nist_beta
```

Uses `how_same` to compare `i`-th beta from NIST-Data with input.
"""

function compare_nist_beta(dataset_name,i,beta)
    x=get_nist_beta(dataset_name,i)
    #println("nist beta= ",x)
    return how_same(float(x),beta)
end

"""
```julia
compare_nist_standarderror
```

Uses `how_same` to compare `i`-th Standarderror from NIST-Data with input.
"""


function compare_nist_standarderror(dataset_name,i,sd)
    x=get_nist_standarderror(dataset_name, i)
    #println("nist sd= ",x)
    return how_same(float(x),sd)
end

"""
```julia
compare_nist_rsd
```

Uses `how_same` to compare rsd from NIST-Data with input.
"""

function compare_nist_rsd(dataset_name,rsd)
    x=get_nist_rsd(dataset_name)
    #println("nist rsd= ",x)
    return how_same(float(x),rsd)
end

"""
```julia
compare_nist_rsquare
```

Uses `how_same` to compare rsquare from NIST-Data with input.
"""

function compare_nist_rsquare(dataset_name,rsq)
    x=get_nist_rsquare(dataset_name)
    #println("nist rsquare= ",x)
    return how_same(float(x),rsq)
end