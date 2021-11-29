# This file is a part of BitOperations.jl, licensed under the MIT License (MIT).


const BitCount = Union{Signed, Unsigned}



@inline fbc(::Type{T}, x) where {T} = x%unsigned(T)
@inline fbc(::Type{T}, bits::UnitRange{U}) where {T,U} = fbc(T, bits.start):fbc(T, bits.stop)


function bsizeof end
export bsizeof

"""
    bsizeof(x)

Returns the data size of x in bits.
"""
@inline bsizeof(x) = sizeof(x) << 3


function bmask end
export bmask

"""
    bmask(::Type{T}, bit::Integer)::T where {T<:Integer}

Generates a bit mask of type `T` with bit `bit` set to one.
"""
@inline bmask(::Type{T}, bit::BitCount) where {T<:Integer} = one(T) << fbc(T, bit)

"""
    bmask(::Type{T}, bits::UnitRange{<:Integer})::T where {T<:Integer}

Generates a bit mask of type `T` with bit-range `bits` set to one.
"""
@inline bmask(::Type{T}, bits::UnitRange{<:BitCount}) where {T<:Integer} = begin
    fbits = fbc(T, bits)
    #@assert fbits.stop >= fbits.start "Bitmask range of fbits can't be reverse"
    ((one(T) << (fbits.stop - fbits.start + 1)) - one(T)) << fbits.start
end


function lsbmask end
export lsbmask

"""
    lsbmask(::Type{T})::T where {T<:Integer}

Generates a bit mask with only the least significant bit set.
"""
@inline lsbmask(::Type{T}) where {T<:Integer} = one(T)

"""
    lsbmask(::Type{T}, nbits::Integer)::T where {T<:Integer}

Generates a bit mask with only the `nbits` least significant bits set.
"""
@inline lsbmask(::Type{T}, nbits::BitCount) where {T<:Integer} = ~(~zero(T) << fbc(T, nbits))


function msbmask end
export msbmask

"""
    msbmask(::Type{T})::T where {T<:Integer}

Generates a bit mask with only the most significant bit set.
"""
@inline msbmask(::Type{T}) where {T<:Integer} = one(T) << fbc(T, bsizeof(T) - 1)

"""
    msbmask(::Type{T}, nbits::Integer)::T where {T<:Integer}

Generates a bit mask with only the `nbits` most significant bits set.
"""
@inline msbmask(::Type{T}, nbits::BitCount) where {T<:Integer} = ~(~zero(T) >>> fbc(T, nbits))


function bget end
export bget

"""
    bget(x::T, bit::Integer)::Bool where {T<:Integer}

Get the value of bit `bit` of x.
"""
@inline bget(x::T, bit::BitCount) where {T<:Integer} = x & bmask(T, fbc(T, bit)) != zero(T)

"""
    bget(x::T, bits::UnitRange{<:Integer})::T where {T<:Integer}

Get the value of the bit range `bits` of x.
"""
@inline bget(x::T, bits::UnitRange{<:BitCount}) where {T<:Integer} = begin
    fbits = fbc(T, bits)
    (x & bmask(T, fbits)) >>> fbits.start
end


function bset end
export bset

"""
    bset(x::T, bit::Integer)::T where {T<:Integer}

Returns a modified copy of x, with bit `bit` set (to one).
"""
@inline bset(x::T, bit::BitCount) where {T<:Integer} = x | bmask(T, fbc(T, bit))

"""
    bset(x::T, bit::Integer, y::Bool)::T where {T<:Integer}

Returns a modified copy of x, with bit `bit` set to `y`.
"""
@inline bset(x::T, bit::BitCount, y::Bool) where {T<:Integer} = y ? bset(x, fbc(T, bit)) : bclear(x, fbc(T, bit))

"""
    bset(x::T, bits::UnitRange{<:Integer}, y::Integer)::T where {T<:Integer}

Returns a modified copy of x, with bit range `bits` set to `y`.
"""
@inline bset(x::T, bits::UnitRange{<:BitCount}, y::Integer) where {T<:Integer} = begin
    fbits = fbc(T, bits)
    local bm = bmask(T, fbits)
    (x & ~bm) | ((convert(T, y) << fbits.start) & bm)
end


function bclear end
export bclear

"""
    bclear(x::T, bit::Integer)::T where {T<:Integer}

Returns a modified copy of x, with bit `bit` cleared (set to zero).
"""
@inline bclear(x::T, bit::BitCount) where {T<:Integer} = x & ~bmask(T, fbc(T, bit))



function bflip end
export bflip

"""
    bflip(x::T, bit::Integer)::T where {T<:Integer}

Returns a modified copy of x, with bit `bit` flipped.
"""
@inline bflip(x::T, bit::BitCount) where {T<:Integer} = xor(x, bmask(T, fbc(T, bit)))

"""
    bflip(x::T, bits::UnitRange{<:Integer})::T where {T<:Integer}

Returns a modified copy of x, with all bits in bit range `bits` flipped.
"""
@inline bflip(x::T, bits::UnitRange{<:BitCount}) where {T<:Integer} = xor(x, bmask(T, fbc(T, bits)))


function lsbget end
export lsbget

"""
    lsbget(x::Integer)::Bool

Returns the value of the least significant bit of x.
"""
@inline lsbget(x::T) where {T<:Integer} =
    x & lsbmask(T) != zero(T)

"""
    lsbget(x::T)::T where {T <: Integer}

Returns the value of the `nbits` least significant bits of x.
"""
@inline lsbget(x::T, nbits::BitCount) where {T<:Integer} =
    x & lsbmask(T, fbc(T, nbits))


function msbget end
export msbget

"""
    msbget(x::T)::Bool where {T<:Integer}

Returns the value of the most significant bit of x.
"""
@inline msbget(x::T) where {T<:Integer} =
    x & msbmask(T) != zero(T)

"""
    msbget(x::T)::T where {T<:Integer}

Returns the value of the `nbits` most significant bits of x.
"""
@inline msbget(x::T, nbits::BitCount) where {T<:Integer} =
    x >>> (bsizeof(x) - fbc(T, nbits))
