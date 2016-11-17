function [B_filt] = run_cc(I,nn,threshold_level_set,params_step2)

% blob analysis
B_temp = I>(threshold_level_set+1.0);
B_filt = bwareaopen(B_temp,nn);
CC = bwconncomp(B_filt);
for i=1:CC.NumObjects;
    if(length(CC.PixelIdxList{i}) > params_step2.siz_upper) 
        B_filt(CC.PixelIdxList{i}) = 0;
    end
end

end

