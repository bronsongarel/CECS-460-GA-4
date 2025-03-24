# CECS-460-GA-4

This projecct simulates an 8-bit audio stream sample being stored in BRAM.  These values stored in BRAM are distorted using distort.v and then filtered using filter.v and p_fir.v.  The outputs of these modules will then be stored back into BRAM. The two models are then simulated in order to compare the results

While this was the intended implementation of the project, errors occured while simulating causing Vivado to crash.  In order to obtain accurate results, doEverything is a standalone module that will perform both filters and store them into seperate output variables.  While this does not store the values into BRAM, it allows for data to be collected about the different effects of the filters.
