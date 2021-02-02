# Use
#
#     DOCUMENTER_DEBUG=true julia --color=yes make.jl local [nonstrict] [fixdoctests]
#
# for local builds.

using Documenter
using BitOperations

makedocs(
    sitename = "BitOperations",
    modules = [BitOperations],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical = "https://oschulz.github.io/BitOperations.jl/stable/"
    ),
    pages = [
        "Home" => "index.md",
        "API" => "api.md",
        "LICENSE" => "LICENSE.md",
    ],
    doctest = ("fixdoctests" in ARGS) ? :fix : true,
    linkcheck = !("nonstrict" in ARGS),
    strict = !("nonstrict" in ARGS),
)

deploydocs(
    repo = "github.com/oschulz/BitOperations.jl.git",
    forcepush = true,
    push_preview = true,
)
