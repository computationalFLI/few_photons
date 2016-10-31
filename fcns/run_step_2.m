fprintf('Executing step 2 of computational framework... \n');

% perform thresholding
v_t = params_step2.B:0.2:params_step2.stretch;
M = zeros(nr,nc);
for ii = 1:length(v_t)
    % filter components too small
    M_hat = run_cc(C_hat,params_step2.siz_filt,v_t(ii));
    CC = bwconncomp(M_hat);
    % filter components too large
    for i=1:CC.NumObjects
        if(length(CC.PixelIdxList{i}) > params_step2.siz_upper) 
            M_hat(CC.PixelIdxList{i}) = 0;
        end
    end
    M = M | M_hat;
end
%