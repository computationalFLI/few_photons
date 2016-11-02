fprintf('Executing step 2 of computational framework... \n');

% perform thresholding
v_t = linspace((params_step2.B-params_step2.relax),params_step2.stretch,params_step2.num);
M = zeros(nr,nc);
for ii = 1:length(v_t)
    % filter components
    M_hat = run_cc(C_hat,params_step2.siz_filt,v_t(ii),params_step2);
    M = M | M_hat;
end
%