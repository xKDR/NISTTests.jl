
mutable struct NISTLREstimates
    coef::FPVector
    stderror::FPVector
    dispersion::Real
    r2::Real
    hasintercept::Bool
    NISTLREstimates(beta::FPVector, std::FPVector, dev::Real, rsq::Real) = 
        new(float(beta), float(std), float(dev), float(rsq), true)
end

struct NISTLRModel <: NISTModel
    data::DataFrame
    formula::FormulaTerm
    certified::NISTLREstimates
    hasintercept::Bool
    datasetname::Symbol
    NISTLRModel(dt::DataFrame, fm::FormulaTerm, cert::NISTLREstimates, hasintcpt::Bool, name::Symbol) = new(dt, fm, cert, hasintcpt, name)
end

function NISTLRModel(data::DataFrame, fm::FormulaTerm, hasintercept::Bool,
                     beta::FPVector, std::FPVector, dev::Real, rsq::Real,
                     name::Symbol)
    values = NISTLREstimates(beta, std, dev, rsq)
    return new(data, fm, values, hasintercept, name)
end
        

nist_data(datsetname::Symbol) = get_nist_data(datsetname)


"""
```julia
certified_coef
```
Certified estimates of slope parameters
"""

certified_coef(ct::NISTModel) = ct.certified.coef   

"""
```julia
certified_stderror
```
Certified standard error of slope parameters
"""
certified_stderror(ct::NISTModel) = ct.certified.stderror   

"""
```julia
certified_dispersion
```
Certified residual standard deviation of the model
"""
certified_dispersion(ct::NISTModel) = ct.certified.dispersion 

"""
```julia
certified_r2
```
Certified r-sqaured of the model
"""
certified_r2(ct::NISTModel) = ct.certified.r2

"""
```julia
certified_r²
```
Certified r-sqaured of the model
"""
const certified_r² = certified_r2

"""
```julia
certified_values
```
Certified estimates
"""
certified_values(ct::NISTModel) = ct.certified

"""
```julia
nist_data
```
"""
nist_data(mdl::NISTModel) = mdl.data

"""
```julia
formula
```
"""
formula(mdl::NISTModel) = mdl.formula

"""
```julia
modelcols
```
"""
function modelcols(mdl::NISTModel)
    StatsModels.modelcols(apply_schema(mdl.formula, schema(mdl.formula, mdl.data),
        RegressionModel), mdl.data)
end

"""
```julia
modelcols
```
"""
datasetname(mdl::NISTModel) = mdl.datasetname

"""
```julia
nist_model
```
NIST Model for a given dataset
"""
function nist_model(datasetname::Symbol)
    check_datasetname(datasetname)
    if datasetname == :Norris
        return norris_model()
    elseif datasetname == :Pontius
        return pontius_model()
    else
        throw("Not Implemented Yet")
    end
end

function Base.show(io::IO, ct::NISTLREstimates)
    nr = length(ct.coef)
    nr == length(ct.stderror) || throw(DimensionMismatch("Length of estimates are different from NIST"))
    
    iz = ct.hasintercept ? 0 : 1

    println(io, "Coefficient:")
    println(io, " "^8, rpad("Estimate", 20), rpad("Std. Error", 20))
    coef = ct.coef
    stderror = ct.stderror
    for ix = 1:nr
        println(io, rpad("β$iz", 8), rpad(@sprintf("%.16f", coef[ix]), 20), 
        rpad(@sprintf("%.16f", stderror[ix]), 20))
        iz = iz + 1
    end
    println(io)
    println(io, "Residual Standard Deviation:", @sprintf("%.16f", ct.dispersion))
    println(io)
    println(io, "R-Squared:", @sprintf("%.16f", ct.r2))
end