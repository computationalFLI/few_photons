
% MATLAB code implementation + data used in  
% "Computational fluorescence-lifetime imaging
%  using a small number of photons" by 
% F.Xu, D.Shin, H.Utzat, D.D.-U.Li, 
% R.S.Saleeb, Y.Chen, I.Coropceanu, P.A.Dalgarno
% F.N.C.Wong, M.G.Bawendi, V.K.Goyal, J.H.Shapiro

% uses variants of SPIRAL-TAP 

%%
%% Select experimental scene

clc; clear; close all;

% choose type_scene as one of the following strings:
%   'microscopy_GFP'    
%   'microscopy_GFPmCherry'
%   'standoff_sensing_circles'   

type_scene = 'standoff_sensing_circles';  

%%
%% Run computational algorithm

clc;

addpath(genpath('data'))
addpath(genpath('fcns'))

load_parameters();
run_preprocessing();
run_step_1(); % fluorescence intensity reconstruction
run_step_2(); % fluorophore mask estimation
run_step_3(); % data filtering using mask
run_step_4(); % fluorescence lifetime reconstruction
fprintf('Finished running computational framework! \n')

%%
%% Make plots

close all;

plotter();

%%
