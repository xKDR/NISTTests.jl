@test size(NISTTests.get_nist_data(:Filip)) == (82,11)
@test size(NISTTests.get_nist_data(:Longley)) == (16,7)
@test size(NISTTests.get_nist_data(:NoInt1)) == (11,2)
@test size(NISTTests.get_nist_data(:NoInt2)) == (3,2)
@test size(NISTTests.get_nist_data(:Norris)) == (36,2)
@test size(NISTTests.get_nist_data(:Pontius)) == (40,2)
@test size(NISTTests.get_nist_data(:Wampler1)) == (21,2)
@test size(NISTTests.get_nist_data(:Wampler2)) == (21,2)
@test size(NISTTests.get_nist_data(:Wampler3)) == (21,2)
@test size(NISTTests.get_nist_data(:Wampler4)) == (21,2)
@test size(NISTTests.get_nist_data(:Wampler5)) == (21,2)
@test_throws ArgumentError size(NISTTests.get_nist_data(:Wampler6))