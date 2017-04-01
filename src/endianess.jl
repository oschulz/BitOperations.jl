# This file is a part of BitManip.jl, licensed under the MIT License (MIT).

function bswap! end
export bswap!

function ntoh! end
export ntoh!

function hton! end
export hton!

function ltoh! end
export ltoh!

function htol! end
export htol!


bswap!(x::AbstractArray) = begin
    @inbounds for i in eachindex(x)
        x[i] = Base.bswap(x[i])
    end
    x
end


bswap!(dest::AbstractArray, src) = begin
    @inbounds for i in eachindex(dest, src)
        dest[i] = Base.bswap(src[i])
    end
    dest
end


if ENDIAN_BOM == 0x01020304
    ntoh!(x) = x
    hton!(x) = x
    ltoh!(x) = bswap!(x)
    htol!(x) = bswap!(x)

    ntoh!(dest::AbstractArray, src) = copy!(dest, src)
    hton!(dest::AbstractArray, src) = copy!(dest, src)
    ltoh!(dest::AbstractArray, src) = bswap!(dest, src)
    htol!(dest::AbstractArray, src) = bswap!(dest, src)
elseif ENDIAN_BOM == 0x04030201
    ntoh!(x) = bswap!(x)
    hton!(x) = bswap!(x)
    ltoh!(x) = x
    htol!(x) = x

    ntoh!(dest::AbstractArray, src) = bswap!(dest, src)
    hton!(dest::AbstractArray, src) = bswap!(dest, src)
    ltoh!(dest::AbstractArray, src) = copy!(dest, src)
    htol!(dest::AbstractArray, src) = copy!(dest, src)
else
    error("Unknown machine endianess")
end
