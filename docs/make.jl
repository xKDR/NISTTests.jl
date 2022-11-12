using NISTTests
using Documenter

DocMeta.setdocmeta!(NISTTests, :DocTestSetup, :(using NISTTests); recursive=true)

makedocs(;
    modules=[NISTTests],
    authors="xKDR Forum",
    repo="https://github.com/xKDR/NISTTests.jl/blob/{commit}{path}#{line}",
    sitename="$NISTTests.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://xKDR.github.io/NISTTests.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
    ],
)

deploydocs(;
    repo="github.com/xKDR/NISTTests.jl",
    target = "build",
    devbranch="main"
)
