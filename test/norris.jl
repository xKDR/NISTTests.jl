@test julia_summary_norris("norris")[4] ≈ 0.9999937458837117
@test julia_summary_norris("norris")[3] ≈ 0.8847963961443875
@test R_summary_norris("norris")[3] ≈ 0.8847963961443794
@test R_summary_norris("norris")[4] ≈ 0.9999937458837117
@test size(full_norris("norris")) == (2, 12)
@test size(full_compare_norris("norris")) == (2, 12)