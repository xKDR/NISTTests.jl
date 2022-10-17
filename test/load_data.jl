@test size(get_nist_data("noint2")) == (3,2)
@test get_nist_beta("noint2",1) ≈ 0.727272727