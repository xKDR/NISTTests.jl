@test julia_summary_wampler("wampler2")[4] ≈ 1.0
@test julia_summary_wampler("wampler4")[4] ≈ 0.9574784408256621
@test R_summary_wampler("wampler5")[4] ≈ 0.0022466892157494006
@test R_summary_wampler("wampler3")[3] ≈ 2360.145023792676
@test size(full_wampler("wampler3")) == (6, 12)
@test size(full_compare_wampler("wampler5")) == (6, 12)