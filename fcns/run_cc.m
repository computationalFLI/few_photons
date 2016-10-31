function [B_filt] = run_cc(I,nn,threshold_level_set)

% connected component analysis
B_temp = I>(threshold_level_set+1.0);
B_filt = bwareaopen(B_temp,nn);

end

