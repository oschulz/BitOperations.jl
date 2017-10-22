# This file is a part of BitManip.jl, licensed under the MIT License (MIT).

import Compat.Test
Test.@testset "Package BitManip" begin
    include("test_bitops.jl")
    include("test_zigzagenc.jl")
end
