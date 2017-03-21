# This file is a part of BitManip.jl, licensed under the MIT License (MIT).

export zigzagenc
export zigzagdec


@inline zigzagenc(x::Signed) = unsigned((x << 1) $ (x >> (8 * sizeof(x) - 1)))

@inline zigzagdec(x::Unsigned) = signed((x >>> 1) $ (-(x & 1)))
