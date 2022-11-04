@test julia_summary_filip("filip")[4] ≈ -3.5759189102560125
@test julia_summary_filip("filip")[3] ≈ 0.12021658745730265
@test R_summary_filip("filip")[4] ≈ 0.9957964530989105
@test R_summary_filip("filip")[3] ≈ 0.0037680121878278126
@test size(full_filip("filip")) == (11,12)
@test size(full_compare_filip("filip")) == (11,12)