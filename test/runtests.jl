# This file is a part of BitOperations.jl, licensed under the MIT License (MIT).

import Test
Test.@testset "Package BitOperations" begin
    include("test_bitops.jl")
    include("test_zigzagenc.jl")
end
