# This file is a part of BitManip.jl, licensed under the MIT License (MIT).

__precompile__(true)

module BitManip

include.([
    "bitops.jl",
    "endianess.jl",
    "zigzagzenc.jl",
])

end # module
