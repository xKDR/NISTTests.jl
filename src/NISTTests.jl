module NISTTests

using CSV, DataFrames, GLM, RCall

# Write your package code here.
export get_nist_data, get_nist_beta, get_nist_rsd, get_nist_rsquare, get_nist_standarderror
export how_same, compare_nist_beta, compare_nist_rsd, compare_nist_rsquare, compare_nist_standarderror
export julia_summary_noint, R_summary_noint, full_noint, full_compare_noint
export julia_summary_wampler, R_summary_wampler, full_wampler, full_compare_wampler
export julia_summary_pontius, R_summary_pontius, full_pontius, full_compare_pontius
export julia_summary_norris, R_summary_norris, full_norris, full_compare_norris
export julia_summary_longley, R_summary_longley, full_longley, full_compare_longley
export julia_summary_filip, R_summary_filip, full_filip, full_compare_filip
export full_dataset, full_dataset_compare

include("load_data.jl")
include("compare.jl")
include("noint.jl")
include("wampler.jl")
include("pontius.jl")
include("norris.jl")
include("longley.jl")
include("filip.jl")
include("final_compare.jl")

end

