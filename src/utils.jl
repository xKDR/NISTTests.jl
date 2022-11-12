
const PKG_DIR = joinpath(pathof(NISTTests), "..", "..") |> normpath
data_path(args...) = joinpath(PKG_DIR, "data", args...)

"""
```julia
NISTLinearRegTable
```
Type to represent frequentist regression models returned by `fit` functions. This type is used internally by the package to represent all frequentist regression models. `RegressionType` is a `Symbol` representing the model class.
"""
mutable struct NISTLinearRegTable
    cert_beta::FPVector
    calc_beta::FPVector
    beta_diff::FPVector
    cert_stderr::FPVector
    calc_stderr::FPVector
    stderr_diff::FPVector
    cert_rsd::Real
    calc_rst::Real
    rsd_diff::Int8
    cert_rsquare::Real
    calc_rsquare::Real
    rsq_diff::Int8
    hasintercept::Bool
end

function NISTLinearRegTable(nist_beta::FPVector, beta::FPVector,
        nist_stdr::FPVector,  stdr::FPVector,
        nist_rsd::Real, rsd::Real,
        nist_rsq::Real, rsq::Real,
        hasincercept::Bool=true)

        NISTLinearRegTable(nist_beta, beta, float(precision_level(nist_beta, beta)),
        nist_stdr, stdr, float(precision_level(nist_stdr, stdr)),
        nist_rsd, rsd, precision_level(nist_rsd, rsd),
        nist_rsq, rsq, precision_level(nist_rsq, rsq),
        hasincercept
        )    
end

function Base.show(io::IO, ct::NISTLinearRegTable)
    nr = length(ct.cert_beta)
    nr == length(ct.calc_beta) && nr == length(ct.calc_stderr) || throw(DimensionMismatch("Length of estimates are different from NIST"))
    
    iz = ct.hasintercept ? 0 : 1

    #println(io, "NIST Dataset: " * String(ct.datasetname))
    println(io, "Comparison with Norris NIST Dataset")
    println(io)
    println(io, "Coefficient:")
    println(io, " "^8, rpad("NIST Certified", 20), rpad("Calculated", 20), "Precision") 
    for ix = 1:nr
        line = rpad("β$iz", 8) * 
            rpad(@sprintf("%.16f", ct.cert_beta[ix]), 20) *
            rpad(@sprintf("%.16f", ct.calc_beta[ix]), 20) * 
            rpad(@sprintf("%.0f", ct.beta_diff[ix]), 8)
        println(io, line)
        iz = iz + 1
    end

    iz = ct.hasintercept ? 0 : 1
    println(io)
    println(io, "Standard Deviation of Estimate:")
    println(io, " "^8, rpad("NIST Certified", 20), rpad("Calculated", 20), "Precision") 
    for ix = 1:nr
        line = rpad("β$iz", 8) * 
            rpad(@sprintf("%.16f", ct.cert_stderr[ix]), 20) *
            rpad(@sprintf("%.16f", ct.calc_stderr[ix]), 20) * 
            rpad(@sprintf("%.0f", ct.stderr_diff[ix]), 8)
        println(io, line)
        iz = iz + 1
    end
    println(io)
    println(io, "Residual Standard Deviation:")
    println(io, rpad("NIST Certified", 20), rpad("Calculated", 20), "Precision")
    line = rpad(@sprintf("%.16f", ct.cert_rsd), 20) *
        rpad(@sprintf("%.16f", ct.calc_rst), 20) * 
        rpad(@sprintf("%.0f", ct.rsd_diff), 8)
    println(io, line)
    
    println(io)
    println(io, "R-Squared:")
    println(io, rpad("NIST Certified", 20), rpad("Calculated", 20), "Precision")
    line = rpad(@sprintf("%.16f", ct.cert_rsquare), 20) *
        rpad(@sprintf("%.16f", ct.calc_rsquare), 20) * 
        rpad(@sprintf("%.0f", ct.rsq_diff), 8)
    println(io, line)
end

"""
precision_level(x, y)
Return the maximum decimal place (<=16) two given numbers are equal.
If the arguments are vectors then it returns the precision for each element

# Examples
```julia
julia> precision_level(2.3456, 2.3457)
3
```
"""
function precision_level(x::Real, y::Real)
    ans = 0
    for prec in 16:-1:1
        tst = isapprox(x, y, atol=10.0^(-prec))
        if(tst)
            ans=prec
            break
        end
    end
    return ans
end

function precision_level(x, y)
    n1 = length(x)
    n2 = length(y)
    n1 == n2 || throw(DimensionMismatch("lengths of x and y ($n1, $n2) are not equal")) 
    ans = zeros(Int8, n1)
    @inbounds for i in eachindex(x, y)
        ans[i] = precision_level(float(x[i]), float(y[i]))
    end
    return ans
end

"""
```julia
get_nist_data
```
Function to load data from pecified NIST Dataset as a given sink object.
"""
function get_nist_data(filename::String, sink = DataFrame)
    @assert filename ∈ readdir(data_path())
    df=CSV.read(data_path(filename), sink, missingstring="NA")
    return df
end

function get_nist_data(datasetname, sink = DataFrame)
    datasetname in _NIST_LR_DATASETS ||
        throw(ArgumentError("Unsupported dataset `$(type)``; supported datasets are" *
                            "$(_NIST_LR_DATASETS)"))
    filename = String(datasetname) * ".csv"
    filename = lowercase(filename)
    get_nist_data(filename, sink)
end

function check_datasetname(datasetname::Symbol)
    datasetname in _NIST_LR_DATASETS ||
        throw(ArgumentError("Unsupported dataset `$(type)``; supported datasets are" *
                            "$(_NIST_LR_DATASETS)"))
    nothing
end