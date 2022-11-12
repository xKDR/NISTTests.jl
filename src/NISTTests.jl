module NISTTests

using CSV, DataFrames, StatsModels, GLM, Printf, RCall

export nist_data, data, coef, stderror, deviance, r2, r², compare, modelcols, formula,
       nist_certified_values, nist_model
export norris_data, norris_certified_values, norris_model, norris_compare, norris_model_formula

const FP = AbstractFloat
const FPVector{T<:FP} = AbstractArray{T,1}
const _NIST_LR_DATASETS = [:Norris, :Pontius, :NoInt1, :NoInt2, :Filip, :Longley,
    :Wampler1, :Wampler2, :Wampler3, :Wampler4, :Wampler5]

include("load_data.jl")
include("utils.jl")
include("nist.jl")
include("noint.jl")
include("wampler.jl")
include("pontius.jl")
include("norris.jl")
include("longley.jl")
include("filip.jl")
include("final_compare.jl")

end

