var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#BitOperations.jl-1",
    "page": "Home",
    "title": "BitOperations.jl",
    "category": "section",
    "text": "BitOperations is a Julia package for bit and register operations. It is mainly intended for Julia code that needs to communicate with hardware (e.g. with a register-based memory model) or work with intricate binary data formats.While bit-manipulation operations are typically easy to implement on-the-fly, using a set of library functions (as provided by this package) improves code readability and reduces the potential for errors.BitOperations.jl conventions:Bit indices start at zero: bmask(Int, 0) == 0x01, bmask(Int, 1) == 0x02."
},

{
    "location": "#Provided-functions-1",
    "page": "Home",
    "title": "Provided functions",
    "category": "section",
    "text": "Basic bit operations:bsizeof, bmask, lsbmask, msbmask, bget, bset, bclear, bflip, lsbget, msbgetZigzag encoding/decoding (Google Protocol Buffers compatible):zigzagenc, zigzagdec"
},

{
    "location": "api/#",
    "page": "API",
    "title": "API",
    "category": "page",
    "text": ""
},

{
    "location": "api/#API-1",
    "page": "API",
    "title": "API",
    "category": "section",
    "text": "DocTestSetup  = quote\n    using BitOperations\nend"
},

{
    "location": "api/#Types-1",
    "page": "API",
    "title": "Types",
    "category": "section",
    "text": "Order = [:type]"
},

{
    "location": "api/#Functions-1",
    "page": "API",
    "title": "Functions",
    "category": "section",
    "text": "Order = [:function]"
},

{
    "location": "api/#BitOperations.bclear-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bclear",
    "category": "method",
    "text": "bclear(x::T, bit::Integer)::T where {T<:Integer}\n\nReturns a modified copy of x, with bit bit cleared (set to zero).\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bflip-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bflip",
    "category": "method",
    "text": "bflip(x::T, bit::Integer)::T where {T<:Integer}\n\nReturns a modified copy of x, with bit bit flipped.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bflip-Union{Tuple{T}, Tuple{T,UnitRange{#s12} where #s12<:Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bflip",
    "category": "method",
    "text": "bflip(x::T, bits::UnitRange{<:Integer})::T where {T<:Integer}\n\nReturns a modified copy of x, with all bits in bit range bits flipped.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bget-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bget",
    "category": "method",
    "text": "bget(x::T, bit::Integer)::Bool where {T<:Integer}\n\nGet the value of bit bit of x.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bget-Union{Tuple{T}, Tuple{T,UnitRange{#s12} where #s12<:Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bget",
    "category": "method",
    "text": "bget(x::T, bits::UnitRange{<:Integer})::T where {T<:Integer}\n\nGet the value of the bit range bits of x.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bmask-Union{Tuple{T}, Tuple{Type{T},Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bmask",
    "category": "method",
    "text": "bmask(::Type{T}, bit::Integer)::T where {T<:Integer}\n\nGenerates a bit mask of type T with bit bit set to one.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bmask-Union{Tuple{T}, Tuple{Type{T},UnitRange{#s13} where #s13<:Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bmask",
    "category": "method",
    "text": "bmask(::Type{T}, bits::UnitRange{<:Integer})::T where {T<:Integer}\n\nGenerates a bit mask of type T with bit-range bits set to one.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bset-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned},Bool}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bset",
    "category": "method",
    "text": "bset(x::T, bit::Integer, y::Bool)::T where {T<:Integer}\n\nReturns a modified copy of x, with bit bit set to y.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bset-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bset",
    "category": "method",
    "text": "bset(x::T, bit::Integer)::T where {T<:Integer}\n\nReturns a modified copy of x, with bit bit set (to one).\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bset-Union{Tuple{T}, Tuple{T,UnitRange{#s12} where #s12<:Union{Signed, Unsigned},Integer}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.bset",
    "category": "method",
    "text": "bset(x::T, bits::UnitRange{<:Integer}, y::Integer)::T where {T<:Integer}\n\nReturns a modified copy of x, with bit range bits set to y.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.bsizeof-Tuple{Any}",
    "page": "API",
    "title": "BitOperations.bsizeof",
    "category": "method",
    "text": "bsizeof(x)\n\nReturns the data size of x in bits.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.lsbget-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.lsbget",
    "category": "method",
    "text": "lsbget(x::T)::T where {T <: Integer}\n\nReturns the value of the nbits least significant bits of x.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.lsbget-Union{Tuple{T}, Tuple{T}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.lsbget",
    "category": "method",
    "text": "lsbget(x::Integer)::Bool\n\nReturns the value of the least significant bit of x.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.lsbmask-Union{Tuple{Type{T}}, Tuple{T}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.lsbmask",
    "category": "method",
    "text": "lsbmask(::Type{T})::T where {T<:Integer}\n\nGenerates a bit mask with only the least significant bit set.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.lsbmask-Union{Tuple{T}, Tuple{Type{T},Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.lsbmask",
    "category": "method",
    "text": "lsbmask(::Type{T}, nbits::Integer)::T where {T<:Integer}\n\nGenerates a bit mask with only the nbits least significant bits set.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.msbget-Union{Tuple{T}, Tuple{T,Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.msbget",
    "category": "method",
    "text": "msbget(x::T)::T where {T<:Integer}\n\nReturns the value of the nbits most significant bits of x.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.msbget-Union{Tuple{T}, Tuple{T}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.msbget",
    "category": "method",
    "text": "msbget(x::T)::Bool where {T<:Integer}\n\nReturns the value of the most significant bit of x.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.msbmask-Union{Tuple{Type{T}}, Tuple{T}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.msbmask",
    "category": "method",
    "text": "msbmask(::Type{T})::T where {T<:Integer}\n\nGenerates a bit mask with only the most significant bit set.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.msbmask-Union{Tuple{T}, Tuple{Type{T},Union{Signed, Unsigned}}} where T<:Integer",
    "page": "API",
    "title": "BitOperations.msbmask",
    "category": "method",
    "text": "msbmask(::Type{T}, nbits::Integer)::T where {T<:Integer}\n\nGenerates a bit mask with only the nbits most significant bits set.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.zigzagdec",
    "page": "API",
    "title": "BitOperations.zigzagdec",
    "category": "function",
    "text": "zigzagdec(x::Unsigned)::Signed\n\nZigzag-decode x, Google Protocol Buffers compatible.\n\n\n\n\n\n"
},

{
    "location": "api/#BitOperations.zigzagenc",
    "page": "API",
    "title": "BitOperations.zigzagenc",
    "category": "function",
    "text": "zigzagenc(x::Signed)::Unsigned\n\nZigzag-encode x, Google Protocol Buffers compatible.\n\n\n\n\n\n"
},

{
    "location": "api/#Documentation-1",
    "page": "API",
    "title": "Documentation",
    "category": "section",
    "text": "Modules = [BitOperations]\nOrder = [:type, :function]"
},

{
    "location": "LICENSE/#",
    "page": "LICENSE",
    "title": "LICENSE",
    "category": "page",
    "text": ""
},

{
    "location": "LICENSE/#LICENSE-1",
    "page": "LICENSE",
    "title": "LICENSE",
    "category": "section",
    "text": "using Markdown\nMarkdown.parse_file(joinpath(@__DIR__, \"..\", \"..\", \"LICENSE.md\"))"
},

]}
