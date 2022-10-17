const PKG_DIR = joinpath(pathof(NISTTests), "..", "..") |> normpath
data_path(args...) = joinpath(PKG_DIR, "data", args...)

"""
```julia
get_nist_data
```
Function to load y,x1,x2,.. Data from pecified NIST Dataset as a Dataframe Object.
"""
function get_nist_data(filename)
    filename = filename * ".csv"
    @assert filename ∈ readdir(data_path())
    df=CSV.read(data_path(filename), DataFrame, missingstring="NA")
    return df
end

"""
```julia
get_nist_beta
```
Takes `i` and loads `i`-th Beta value for the specified NIST Dataset.
"""
function get_nist_beta(filename,i)
    filename=filename * "_compare.csv"
    println(filename)
    @assert filename ∈ readdir(data_path())
    df=CSV.read(data_path(filename), DataFrame, missingstring="NA")
    return df[i,1]
end

"""
```julia
get_nist_standarderror

```

Takes `i` and loads `i`-th Standard error value for the specified NIST Dataset.

"""
function get_nist_standarderror(filename, i)
    filename=filename*"_compare.csv"
    @assert filename ∈ readdir(data_path())
    df=CSV.read(data_path(filename), DataFrame, missingstring="NA")
    return df[i,4]
end


"""
```julia
get_nist_rsd
```

Returns the RSD value for the specified NIST Dataset.
"""
function get_nist_rsd(filename)
    filename=filename*"_compare.csv"
    @assert filename ∈ readdir(data_path())
    df=CSV.read(data_path(filename), DataFrame, missingstring="NA")
    return df[1,8]
end

"""
```julia
get_nist_rsquare
```

Return the `R-Square` value for the specified NIST Dataset.

"""
function get_nist_rsquare(filename)
    filename=filename*"_compare.csv"
    @assert filename ∈ readdir(data_path())
    df=CSV.read(data_path(filename), DataFrame, missingstring="NA")
    return df[1,10]
end