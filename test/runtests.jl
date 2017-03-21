# This file is a part of BitManip.jl, licensed under the MIT License (MIT).

@Base.Test.testset "Package BitManip" begin
    include.([
        "test_bitops.jl",
        "test_zigzagenc.jl",
    ])
end
