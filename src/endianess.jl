# This file is a part of BitOperations.jl, licensed under the MIT License (MIT).

# TODO: Deprecate custom byte-order array functions in favour of broadcasting.

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


function _copyto_if_not_same!(dest::AbstractArray, src::AbstractArray)
    if dest !== src
        copyto!(dest, src)
    end
    dest
end


if ENDIAN_BOM == 0x01020304
    ntoh!(dest::AbstractArray, src) = _copyto_if_not_same!(dest, src)
    hton!(dest::AbstractArray, src) = _copyto_if_not_same!(dest, src)
    ltoh!(dest::AbstractArray, src) = bswap!(dest, src)
    htol!(dest::AbstractArray, src) = bswap!(dest, src)
elseif ENDIAN_BOM == 0x04030201
    ntoh!(dest::AbstractArray, src) = bswap!(dest, src)
    hton!(dest::AbstractArray, src) = bswap!(dest, src)
    ltoh!(dest::AbstractArray, src) = _copyto_if_not_same!(dest, src)
    htol!(dest::AbstractArray, src) = _copyto_if_not_same!(dest, src)
else
    error("Unknown machine endianess")
end
