# This file is a part of BitOperations.jl, licensed under the MIT License (MIT).

"""
    zigzagenc(x::Signed)::Unsigned

Zigzag-encode x, Google Protocol Buffers compatible.
"""
function zigzagenc end
export zigzagenc

@inline zigzagenc(x::Signed) = unsigned(xor((x << 1), (x >> (8 * sizeof(x) - 1))))


"""
    zigzagdec(x::Unsigned)::Signed

Zigzag-decode x, Google Protocol Buffers compatible.
"""
function zigzagdec end
export zigzagdec

@inline zigzagdec(x::Unsigned) = signed(xor((x >>> 1), (-(x & 1))))
