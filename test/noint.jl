@test julia_summary_noint("noint2")[4] ≈ 0.9933481152993348 #0.5909090909090905
@test julia_summary_noint("noint1")[3] ≈ 3.567530340063377
@test R_summary_noint("noint2")[4] ≈ 0.9933481152993348
@test R_summary_noint("noint1")[1] ≈ 2.074380165289256
@test size(full_noint("noint1")) == (1,12)
@test size(full_noint("noint2")) == (1,12)
@test size(full_compare_noint("noint1")) == (1,12)
@test size(full_compare_noint("noint2")) == (1,12)