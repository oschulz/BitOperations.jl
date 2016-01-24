function bsizeof end
export bsizeof

function bmask end
export bmask

function lsbmask end
export lsbmask

function msbmask end
export msbmask

function bget end
export bget

function bset end
export bset

function bclear end
export bclear

function lsbget end
export lsbget

function msbget end
export msbget


@inline bsizeof(x) = sizeof(x) << 3


@inline bmask{T <: Integer}(::Type{T}, bit::Integer) = one(T) << bit

@inline bmask{T <: Integer, U <: Integer}(::Type{T}, bits::UnitRange{U}) = begin
  #@assert bits.stop >= bits.start "Bitmask range of bits can't be reverse"
  ((one(T) << (bits.stop - bits.start + 1)) - one(T)) << bits.start
end


@inline lsbmask{T <: Integer}(::Type{T}) = one(T)

@inline msbmask{T <: Integer}(::Type{T}) = one(T) << (bsizeof(T) - 1)


@inline lsbmask{T <: Integer}(::Type{T}, nbits::Integer) = ~(~zero(T) << nbits)

@inline msbmask{T <: Integer}(::Type{T}, nbits::Integer) = ~(~zero(T) >>> nbits)


@inline bget(x::Integer, bit::Integer) = x & bmask(typeof(x), bit) != zero(typeof(x))

@inline bset(x::Integer, bit::Integer, y::Bool) = y ? bset(x, bit) : bclear(x, bit)
@inline bset(x::Integer, bit::Integer) = x | bmask(typeof(x), bit)

@inline bclear(x::Integer, bit::Integer) = x & ~bmask(typeof(x), bit)


@inline bget{U <: Integer}(x::Integer, bits::UnitRange{U}) =
    (x & bmask(typeof(x), bits)) >>> bits.start

@inline bset{U <: Integer}(x::Integer, bits::UnitRange{U}, y::Integer) = begin
    local bm = bmask(typeof(x), bits)
    (x & ~bm) | ((convert(typeof(x), y) << bits.start) & bm)
end


@inline lsbget(x::Integer) =
    x & lsbmask(typeof(x)) != zero(typeof(x))

@inline msbget(x::Integer) =
    x & msbmask(typeof(x)) != zero(typeof(x))


@inline lsbget(x::Integer, nbits::Integer) =
    x & lsbmask(typeof(x), nbits)

@inline msbget(x::Integer, nbits::Integer) =
    x >>> (bsizeof(x) - nbits)
