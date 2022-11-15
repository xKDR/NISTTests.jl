
mutable struct NISTLREstimates
    coef::FPVector
    stderror::FPVector
    dispersion::Real
    r2::Real
    NISTLREstimates(beta::FPVector, std::FPVector, dev::Real, rsq::Real) = 
        new(float(beta), float(std), float(dev), float(rsq))
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
    else
        throw("Not Implemented Yet")
    end
end
