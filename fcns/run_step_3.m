fprintf('Executing step 3 of computational framework... \n');

% perform data filtering

C_hat_filt = C_hat;
C_hat_filt(~M) = 0;
Y = LT_raw;
masks = isnan(Y);
Y(~M) = 0;
Y(masks) = 0;