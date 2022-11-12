

struct NISTLRCertifiedValues
    coef::FPVector
    stderror::FPVector
    devience::Real
    r2::Real
    datasetname::Symbol
    NISTLRCertifiedValues(beta::FPVector, std::FPVector, devience::Real,
        rsq::Real, name::Symbol) = new(float(beta), float(std), float(devience), float(rsq), name)
end

nist_data(datsetname::Symbol) = get_nist_data(datsetname)


"""
```julia
coef
```
Certified estimates of slope parameters
"""

coef(ct::NISTLRCertifiedValues) = ct.coef   

"""
```julia
stderror
```
Certified standard error of slope parameters
"""
stderror(ct::NISTLRCertifiedValues) = ct.stderror   

"""
```julia
deviance
```
Certified residual standard deviation of the model
"""
deviance(ct::NISTLRCertifiedValues) = ct.devience 

"""
```julia
r2
```
Certified r-sqaured of the model
"""
r2(ct::NISTLRCertifiedValues) = ct.r2

"""
```julia
r²
```
Certified r-sqaured of the model
"""
const r² = r2

compare(ct::NISTLRCertifiedValues, beta::FPVector, stderr::FPVector,
    rsd::Real, rsq::Real) =
    NISTLinearRegTable(ct.coef, beta, ct.stderror, stderr, ct.devience, rsd, ct.r2, rsq)

function compare(datasetname::Symbol, beta::FPVector,
        stderr::FPVector, rsd::Real, rsq::Real)
    ct = nist_certified_values(datasetname)
    compare(ct, beta, stderr, rsd, rsq)
end

struct NISTLRCModel
    data::DataFrame
    formula::FormulaTerm
    datasetname::Symbol
    NISTLRCModel(data::DataFrame, fm::FormulaTerm, name::Symbol) = new(data, fm, name)
end

data(mdl::NISTLRCModel) = mdl.data

formula(mdl::NISTLRCModel) = mdl.formula

function modelcols(mdl::NISTLRCModel)
    StatsModels.modelcols(apply_schema(mdl.formula, schema(mdl.formula, mdl.data),
        RegressionModel), mdl.data)
end

datasetname(mdl::NISTLRCModel) = mdl.datasetname

"""
```julia
norris_certified_values
```
NIST certified values for Norris dataset
"""
function nist_certified_values(datasetname::Symbol)
    check_datasetname(datasetname)
    if datasetname == :Norris
        return norris_certified_values()
    else
        throw("Not Implemented Yet")
    end
end

function nist_model(datasetname::Symbol)
    check_datasetname(datasetname)
    if datasetname == :Norris
        return norris_model()
    else
        throw("Not Implemented Yet")
    end
end