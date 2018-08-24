# This file is a part of BitOperations.jl, licensed under the MIT License (MIT).

export zigzagenc
export zigzagdec


@inline zigzagenc(x::Signed) = unsigned(xor((x << 1), (x >> (8 * sizeof(x) - 1))))

@inline zigzagdec(x::Unsigned) = signed(xor((x >>> 1), (-(x & 1))))
