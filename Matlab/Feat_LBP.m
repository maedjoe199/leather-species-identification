clc;
clear all;
close all;

ParentFolder = pwd;

%% Getting the directory in which the leather samples are stored
% Train samples
%Train_Folder = uigetdir(); % get the images for training
Train_Folder = 'H:\Anjli PHD Work\7th Sem(2021-2022)\Prajjwal Work\Result Generation\Train_Test\Train_raw';
Train_Dir = dir(Train_Folder);
Train_Dir = Train_Dir(~ismember({Train_Dir.name},{'.' '..'}));

Trainlen=length(Train_Dir);

% Test samples
%Test_Folder = uigetdir(); % get the images for testing
Test_Folder = 'H:\Anjli PHD Work\7th Sem(2021-2022)\Prajjwal Work\Result Generation\Train_Test\Test_raw';
Test_Dir = dir(Test_Folder);
Test_Dir = Test_Dir(~ismember({Test_Dir.name},{'.' '..'}));

Testlen=length(Test_Dir);

%% LBP Features

% Train LBP Features 
LBPFeat_Tr = [];
for i = 1 : Trainlen
    cd(Train_Folder);
    FileName = fullfile(Train_Dir(i).name);
    Image = imread(FileName); 
    [filepath,name,ext] = fileparts(FileName);

    % LBP Feature Extraction
    lbpImage = extractLBPFeatures(Image);

    LBPFeat_Tr(i,:) = lbpImage;

end
    
cd(ParentFolder);
T1 = table(LBPFeat_Tr);
writetable(T1, 'LBP_Tr.xls', 'WriteVariableNames', true);

% Test LBP Features 
LBPFeat_Tt = [];
for i = 1 : Testlen
    cd(Test_Folder);
    FileName = fullfile(Test_Dir(i).name);
    Image = imread(FileName); 
    [filepath,name,ext] = fileparts(FileName);

    % LBP Feature Extraction
    lbpImage = extractLBPFeatures(Image);

    LBPFeat_Tt(i,:) = lbpImage;

end
    
cd(ParentFolder);
T2 = table(LBPFeat_Tt);
writetable(T2,'LBP_Tt.xls', 'WriteVariableNames', true);
