@test julia_summary_longley("longley")[4] ≈ 0.9954790045772984
@test julia_summary_longley("longley")[3] ≈ 304.85407356222413
@test R_summary_longley("longley")[3] ≈ 304.8540735619636
@test R_summary_longley("longley")[4] ≈ 0.9954790045772957
@test size(full_longley("longley")) == (7, 12)
@test size(full_compare_longley("longley")) == (7, 12)