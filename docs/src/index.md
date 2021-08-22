# BitOperations.jl

BitOperations is a Julia package for bit and register operations. It is mainly
intended for Julia code that needs to communicate with hardware (e.g. with a
register-based memory model) or work with intricate binary data formats.

While bit-manipulation operations are typically easy to implement on-the-fly,
using a set of library functions (as provided by this package) improves code
readability and reduces the potential for errors.

BitOperations.jl conventions:

* Bit indices start at zero: `bmask(Int, 0) == 0x01`, `bmask(Int, 1) == 0x02`.
* Bit ranges also start at zero, counting up from the least significant bit: `bset(0x00, 0:7, 1) == 0xff`.
* Bit ranges must be of type `UnitRange` (start:stop) and not `StepRange` (start:step:stop). As a result, reverse indices are not supported.

## Provided functions

Basic bit operations:

[`bsizeof`](@ref), [`bmask`](@ref), [`lsbmask`](@ref), [`msbmask`](@ref), [`bget`](@ref), [`bset`](@ref), [`bclear`](@ref), [`bflip`](@ref), [`lsbget`](@ref), [`msbget`](@ref)

Zigzag encoding/decoding (Google Protocol Buffers compatible):

[`zigzagenc`](@ref), [`zigzagdec`](@ref)
