fprintf('=  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  \n')
fprintf('=  =  =  =  =  =  COMPUTATIONAL FLI =  =  =  =  =  =  \n')
fprintf('=  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  =  \n\n')
fprintf(['Loading parameters for [' type_scene ']\n'])

% initialization
if(strcmp(type_scene,'standoff_sensing_circles'))
    
    data_dir = 'flim-sample1';
    res = 32;
    num_frames = 3000; 
    bin2ns = res*(1e-3);
    params_step1 = struct('is_diffuser',1,'tau',0.5,'miniter',10,'maxiter',100,'stopcriterion',3,'tolerance',1e-12);
    params_step2 = struct('siz_filt',50,'siz_upper',200,'B',1,'relax',1.5,'stretch',15,'num',25);
    params_step3 = struct('tau',12,'miniter',10,'maxiter',100,'stopcriterion',3,'tolerance',1e-12,'t_r',100,'B_sc',0.01);
    params_plot = struct('is_flip',0,'min_I',0,'max_I',5,'min_L',0,'max_L',30,'cmp','gray');
    
elseif(strcmp(type_scene,'standoff_sensing_MIT_logo'))
    
    data_dir = 'flim-MIT';
    res = 32;
    num_frames = 900; 
    bin2ns = res*(1e-3);
    params_step1 = struct('is_diffuser',1,'tau',0.5,'miniter',10,'maxiter',100,'stopcriterion',3,'tolerance',1e-12);
    params_step2 = struct('siz_filt',50,'siz_upper',200,'B',1,'relax',1.5,'stretch',15,'num',25);
    params_step3 = struct('tau',14,'miniter',10,'maxiter',100,'stopcriterion',3,'tolerance',1e-12,'t_r',100,'B_sc',0.01);
    params_plot = struct('is_flip',1,'min_I',0,'max_I',5,'min_L',0,'max_L',30,'cmp','gray');

elseif(strcmp(type_scene,'microscopy_GFP'))
    
    data_dir = 'GFP_1';  
    params_step1 = struct('is_diffuser',0,'tau',2,'miniter',1,'maxiter',10,'stopcriterion',3,'tolerance',1e-4);
    params_step2 = struct('siz_filt',400,'siz_upper',400*400,'B',0,'relax',0,'stretch',0,'num',1);
    params_step3 = struct('tau',0.86,'miniter',1,'maxiter',20,'stopcriterion',3,'tolerance',1e-12,'t_r',60,'B_sc',0.0);
    params_plot = struct('is_flip',0,'min_I',0,'max_I',10,'min_L',0,'max_L',3,'cmp','hot');

elseif(strcmp(type_scene,'microscopy_GFPmCherry'))
    
    data_dir = 'GFP-mCherry_GFP-channel_40MHz_2';  
    params_step1 = struct('is_diffuser',0,'tau',2,'miniter',1,'maxiter',10,'stopcriterion',3,'tolerance',1e-4);
    params_step2 = struct('siz_filt',400,'siz_upper',400*400,'B',0,'relax',0,'stretch',0,'num',1);
    params_step3 = struct('tau',0.75,'miniter',1,'maxiter',10,'stopcriterion',3,'tolerance',1e-12,'t_r',60,'B_sc',0.0);
    params_plot = struct('is_flip',0,'min_I',0,'max_I',10,'min_L',0,'max_L',3,'cmp','hot');
    
else
    error('not a valid scene type!')
end

