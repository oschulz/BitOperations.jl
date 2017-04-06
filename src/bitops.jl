# This file is a part of BitManip.jl, licensed under the MIT License (MIT).

using Compat

export BitCount, bsizeof, bmask, lsbmask, msbmask, bget, bset, bclear, bflip, lsbget, msbset

const BitCount = Union{Signed, Unsigned}

@inline fbc{T}(::Type{T}, x) = x%unsigned(T)
@inline fbc{T,U}(::Type{T}, bits::UnitRange{U}) = fbc(T, bits.start):fbc(T, bits.stop)


@inline bsizeof(x) = sizeof(x) << 3


@inline bmask{T <: Integer}(::Type{T}, bit::BitCount) = one(T) << fbc(T, bit)

@inline bmask{T <: Integer, U <: BitCount}(::Type{T}, bits::UnitRange{U}) = begin
    fbits = fbc(T, bits)
    #@assert fbits.stop >= fbits.start "Bitmask range of fbits can't be reverse"
    ((one(T) << (fbits.stop - fbits.start + 1)) - one(T)) << fbits.start
end


@inline lsbmask{T <: Integer}(::Type{T}) = one(T)

@inline msbmask{T <: Integer}(::Type{T}) = one(T) << fbc(T, bsizeof(T) - 1)


@inline lsbmask{T <: Integer}(::Type{T}, nbits::BitCount) = ~(~zero(T) << fbc(T, nbits))

@inline msbmask{T <: Integer}(::Type{T}, nbits::BitCount) = ~(~zero(T) >>> fbc(T, nbits))


@inline bget{T <: Integer}(x::T, bit::BitCount) = x & bmask(typeof(x), fbc(T, bit)) != zero(typeof(x))

@inline bset{T <: Integer}(x::T, bit::BitCount, y::Bool) = y ? bset(x, fbc(T, bit)) : bclear(x, fbc(T, bit))
@inline bset{T <: Integer}(x::T, bit::BitCount) = x | bmask(typeof(x), fbc(T, bit))

@inline bclear{T <: Integer}(x::T, bit::BitCount) = x & ~bmask(typeof(x), fbc(T, bit))


@inline bget{T <: Integer, U <: BitCount}(x::T, bits::UnitRange{U}) = begin
    fbits = fbc(T, bits)
    (x & bmask(typeof(x), fbits)) >>> fbits.start
end

@inline bset{T <: Integer, U <: BitCount}(x::T, bits::UnitRange{U}, y::Integer) = begin
    fbits = fbc(T, bits)
    local bm = bmask(typeof(x), fbits)
    (x & ~bm) | ((convert(typeof(x), y) << fbits.start) & bm)
end


@inline bflip{T <: Integer}(x::T, bit::BitCount) = xor(x, bmask(typeof(x), fbc(T, bit)))

@inline bflip{T <: Integer, U <: BitCount}(x::T, bits::UnitRange{U}) = xor(x, bmask(typeof(x), fbc(T, bits)))


@inline lsbget{T <: Integer}(x::T) =
    x & lsbmask(typeof(x)) != zero(typeof(x))

@inline msbget{T <: Integer}(x::T) =
    x & msbmask(typeof(x)) != zero(typeof(x))


@inline lsbget{T <: Integer}(x::T, nbits::BitCount) =
    x & lsbmask(typeof(x), fbc(T, nbits))

@inline msbget{T <: Integer}(x::T, nbits::BitCount) =
    x >>> (bsizeof(x) - fbc(T, nbits))
