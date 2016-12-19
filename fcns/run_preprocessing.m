fprintf('Parsing data...\n')

% C_raw, LT_raw:
% raw intensity and lifetime computed using pixelwise statistics

load(['data/' data_dir]);

% initialization
if(strcmp(type_scene,'standoff_sensing_circles'))
    
    [nr,nc] = size(data_bin);
    C_raw = zeros(nr,nc);
    LT_bin_raw = zeros(nr,nc);
    T_raw = cell(nr,nc);
    M_invalid = zeros(nr,nc);
    for i=1:nr
        for j=1:nc
            vf = data_frame{i,j};
            vt = data_bin{i,j};
            inds = vf<num_frames;
            ts = vt(inds);
            C_raw(i,j) = sum(inds);
            LT_bin_raw(i,j) = mean(ts);
            M_invalid(i,j) = isempty(ts);
            T_raw{i,j} = ts;        
        end
    end
    LT_raw = LT_bin_raw*bin2ns;
    
elseif(strcmp(type_scene,'standoff_sensing_MIT_logo'))
    
    [nr,nc] = size(data_bin);
    C_raw = zeros(nr,nc);
    LT_bin_raw = zeros(nr,nc);
    T_raw = cell(nr,nc);
    M_invalid = zeros(nr,nc);
    for i=1:nr
        for j=1:nc
            vf = data_frame{i,j};
            vt = data_bin{i,j};
            inds = vf<num_frames;
            ts = vt(inds);
            C_raw(i,j) = sum(inds);
            LT_bin_raw(i,j) = mean(ts);
            M_invalid(i,j) = isempty(ts);
            T_raw{i,j} = ts;        
        end
    end
    LT_raw = LT_bin_raw*bin2ns;
    
elseif(strcmp(type_scene,'microscopy_GFP'))

    %load('GFP_truth','I_gt','L_gt'); % ground truth for reference
    h = 0.032; % time bin = 0.125ns; 
    hist = Hist;
    sum_hist = sum(hist);
    intensity = sum(hist');
    int_2d = reshape(intensity,256,256);

    ind_p = find(sum_hist == max(sum_hist)); % Find the peak of the histogram
    y = hist(:,ind_p:end); % this is for CMM estimations
    size_y = size(y);

    Threshold = 1; % for setting dark pixels
    t = 0.5:1:size_y(2)-0.5; % for CMM estimations

    s_y = sum(y')'+1e-15; % +1e-15 is to avoid NaN
    tau11 = (s_y >= Threshold).*((y*t')./s_y); % mean lifetimes

    tau_cmm = tau11 * h; % calculated lifetimes
    tau_2d = reshape(tau_cmm, 256, 256); 

    C_raw = int_2d;
    LT_raw = tau_2d;
    
elseif(strcmp(type_scene,'microscopy_GFPmCherry'))
    
    h = 0.125; % time bin

    hist = Hist;
    sum_hist = sum(hist);
    intensity = sum(hist');
    int_2d = reshape(intensity,512,512);

    ind_p = find(sum_hist == max(sum_hist)); % Find the peak of the histogram

    T=88;
    cut=ind_p+T; % selecting the first 11-ns valid data
    y = hist(:,ind_p:cut); % this is for CMM estimations
    size_y = size(y);

    Threshold = 1; % for setting dark pixels
    t = 0.5:1:size_y(2)-0.5; % for CMM estimations
    s_y = sum(y')'+1e-15; % +1e-15 is to avoid NaN
    tau11 = (s_y >= Threshold).*((y*t')./s_y); % mean lifetimes

    tau_cmm = tau11 * h; % calculated lifetimes
    tau_2d = reshape(tau_cmm, 512, 512); 

    C_raw = int_2d;
    LT_raw = tau_2d;

else
    error('not a valid scene type!')
end
   
ppp_scene = mean(C_raw(:));
[nr,nc] = size(C_raw);
fprintf(['  mean number of photons per pixel = ' num2str(ppp_scene) '\n']);
