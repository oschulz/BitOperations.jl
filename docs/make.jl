# Use
#
#     DOCUMENTER_DEBUG=true julia --color=yes make.jl local [fixdoctests]
#
# for local builds.

using Documenter
using BitOperations

makedocs(
    sitename = "BitOperations",
    modules = [BitOperations],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical = "https://oschulz.github.io/ShapesOfVariables.jl/stable/"
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
        "LICENSE" => "LICENSE.md",
    ],
    doctest = ("fixdoctests" in ARGS) ? :fix : true,
)

deploydocs(
    repo = "github.com/oschulz/BitOperations.jl.git",
    forcepush = true
)
