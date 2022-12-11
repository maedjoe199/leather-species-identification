clc;
clear all;
close all;

ParentFolder = pwd;
%% Training with 2-DWT Data 
cd('H:\Anjli PHD Work\7th Sem(2021-2022)\ACCV 2022\DWT\MATLAB DWT codes Main\DWTFeatures');
T_Tr = readtable('sy_LBP_Tr.xlsx');
Opt_tr = detectImportOptions('sy_LBP_Tr.xlsx');
VarNames_tr = Opt_tr.VariableNames;
VarNames_tr = VarNames_tr(:, 2:end);

Data_tr = table2array(T_Tr(:,2:end));
Data_tr = Data_tr';
Labels_tr = table2array(T_Tr(:,1));

len_tr = size(Data_tr, 2);
ClassLen_tr = len_tr/4;
Buff_tr = [ones(1, ClassLen_tr),zeros(1, ClassLen_tr),zeros(1, ClassLen_tr),zeros(1, ClassLen_tr)];
Cow_tr = [zeros(1, ClassLen_tr),ones(1, ClassLen_tr),zeros(1, ClassLen_tr),zeros(1, ClassLen_tr)];
Goat_tr = [zeros(1, ClassLen_tr),zeros(1, ClassLen_tr),ones(1, ClassLen_tr),zeros(1, ClassLen_tr)];
Sheep_tr = [zeros(1, ClassLen_tr),zeros(1, ClassLen_tr),zeros(1, ClassLen_tr),ones(1, ClassLen_tr)];

L_tr = [Buff_tr; Cow_tr; Goat_tr; Sheep_tr];

%Testing Data (All features)
T_Tt = readtable('sy_LBP_Tt.xlsx');
Data_tt = table2array(T_Tt(:,2:end));
Data_tt = Data_tt';
Labels_tt = table2array(T_Tt(:,1));

len_tt = size(Data_tt, 2);
ClassLen_tt = len_tt/4;
Buff_tt = [ones(1, ClassLen_tt),zeros(1, ClassLen_tt),zeros(1, ClassLen_tt),zeros(1, ClassLen_tt)];
Cow_tt = [zeros(1, ClassLen_tt),ones(1, ClassLen_tt),zeros(1, ClassLen_tt),zeros(1, ClassLen_tt)];
Goat_tt = [zeros(1, ClassLen_tt),zeros(1, ClassLen_tt),ones(1, ClassLen_tt),zeros(1, ClassLen_tt)];
Sheep_tt = [zeros(1, ClassLen_tt),zeros(1, ClassLen_tt),zeros(1, ClassLen_tt),ones(1, ClassLen_tt)];

L_tt = [Buff_tt; Cow_tt; Goat_tt; Sheep_tt];
% Feed Forward Neural Network with 1 hidden layer
% trainFcn = 'trainlm'; 
% trainFcn = 'trainbr'; 
trainFcn = 'trainscg'; 

% 44 hidden neurons
net2 = patternnet(30,trainFcn);
net2.divideParam.trainRatio = 70/100;
net2.divideParam.valRatio = 15/100;
net2.divideParam.testRatio = 15/100;

[net2, tr6] = train(net2,Data_tr,L_tr);
Prednet2 = net2(Data_tt);
[MCnet2, CMnet2] = confusion(L_tt,Prednet2);
AccNet2 = (sum(diag(CMnet2))/sum(CMnet2(:)))*100;

cd(ParentFolder);