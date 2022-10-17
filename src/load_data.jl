
"""
```julia
get_nist_data
```
Function to load y,x1,x2,.. Data from pecified NIST Dataset as a Dataframe Object.
"""
function get_nist_data(filename)
    path=pwd()
    path=path*"\\data\\datasets\\"*filename*".csv"
    df=DataFrame(CSV.File(path))
    return df
end

"""
```julia
get_nist_beta
```
Takes `i` and loads `i`-th Beta value for the specified NIST Dataset.
"""

function get_nist_beta(dataset_name, i)
    path=pwd()
    path=path*"\\data\\certified\\"*dataset_name*"_compare.csv"
    df=DataFrame(CSV.File(path))
    return df[i,1]
end

"""
```julia
get_nist_standarderror

```

Takes `i` and loads `i`-th Standard error value for the specified NIST Dataset.

"""

function get_nist_standarderror(dataset_name, i)
    path=pwd()
    path=path*"\\data\\certified\\"*dataset_name*"_compare.csv"
    df=DataFrame(CSV.File(path))
    return df[i,4]
end


"""
```julia
get_nist_rsd
```

Returns the RSD value for the specified NIST Dataset.
"""

function get_nist_rsd(dataset_name)
    path=pwd()
    path=path*"\\data\\certified\\"*dataset_name*"_compare.csv"
    df=DataFrame(CSV.File(path))
    return df[1,8]
end

"""
```julia
get_nist_rsquare
```

Return the `R-Square` value for the specified NIST Dataset.

"""

function get_nist_rsquare(dataset_name)
    path=pwd()
    path=path*"\\data\\certified\\"*dataset_name*"_compare.csv"
    df=DataFrame(CSV.File(path))
    return df[1,10]
end