"""
```julia
full_dataset
```

Takes Dataset Name as input and returns displays data calculated using `julia` and `R` and actual NIST-Datasets.
"""

function full_dataset(filename)
    if filename in ["noint1","noint2"]
        println("noint")
        full_noint(filename)
    elseif filename in ["wampler1","wampler2","wampler3","wampler4","wampler5"]
        println("wampler")
        full_wampler(filename)
    elseif (filename=="pontius")
        println("pontius")
        full_pontius(filename)
    elseif(filename=="norris")
        println("norris")
        full_norris(filename)
    elseif(filename=="longley")
        println("longley")
        full_longley(filename)
    elseif(filename=="filip")
        println("filip")
        full_filip(filename)
    end
end

"""
```julia
full_dataset_compare
```

Takes Dataset Name as input and compares NIST-Data with ones calculated using `julua` and `R` and displays the compare values.
"""

function full_dataset_compare(filename)
    if filename in ["noint1","noint2"]
        println("noint")
        full_compare_noint(filename)
    elseif filename in ["wampler1","wampler2","wampler3","wampler4","wampler5"]
        println("wampler")
        full_compare_wampler(filename)
    elseif (filename=="pontius")
        println("pontius")
        full_compare_pontius(filename)
    elseif(filename=="norris")
        println("norris")
        full_compare_norris(filename)
    elseif(filename=="longley")
        println("longley")
        full_compare_longley(filename)
    elseif(filename=="filip")
        println("filip")
        full_compare_filip(filename)
    end
end