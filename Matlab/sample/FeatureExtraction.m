clc;
clear all;
close all;

ParentFolder = pwd;

%% Getting the directory in which the leather samples are stored
% Train samples
%Train_Folder = uigetdir(); % get the images for training

Train_Folder = '/Users/edwinjoseph/Projects/leather-species-identification/data/images/raw/Cow';
% Train_Folder = 'raw/Cow';
% Train_Folder = 'H:\Anjli PHD Work\7th Sem(2021-2022)\Prajjwal Work\Result Generation\Train_Test\Train_raw';
Train_Dir = dir(Train_Folder);
Train_Dir = Train_Dir(~ismember({Train_Dir.name},{'.' '..'}));

Trainlen=length(Train_Dir);

% Test samples
%Test_Folder = uigetdir(); % get the images for testing
Test_Folder = '/Users/edwinjoseph/Projects/leather-species-identification/data/images/raw/CowTest';
% Test_Folder = 'raw/CowTest';
% Test_Folder = 'H:\Anjli PHD Work\7th Sem(2021-2022)\Prajjwal Work\Result Generation\Train_Test\Test_raw';
Test_Dir = dir(Test_Folder);
Test_Dir = Test_Dir(~ismember({Test_Dir.name},{'.' '..'}));

Testlen=length(Test_Dir);

%% Train Wavelet Feature Extraction
Entropy = []; Energy = []; Mean = []; Var = []; Std = []; Skew = []; Kurt = [];

for x = 1:Trainlen
    
    cd(Train_Folder);
    Imagedir = fullfile(Train_Dir(x).name);
%     SampleImage = imread(Imagedir);
    SampleImage = rgb2gray(imread(Imagedir));
    H = []; E = []; M = []; V = []; St = []; S = []; K = [];
    Acoef = {}; Hor = {}; Vert = {}; Diag = {};
    k = 2; hvd = 3;
    
    DWTmethod = 'sym2';
    [c,s]=wavedec2(SampleImage,k,DWTmethod); %2d-DWT
    for j = 1:k
        [Hor,Vert,Diag] = detcoef2('all',c,s,j);
        Acoef = appcoef2(c,s,DWTmethod,j);
        cd(ParentFolder);
        H = [H entropy(uint8(Hor)) entropy(uint8(Vert)) entropy(uint8(Diag))];
        E = [E energy(Hor) energy(Vert) energy(Diag)];
        M = [M mean2(Hor) mean2(Vert) mean2(Diag)];
        V = [V var2(Hor) var2(Vert) var2(Diag)];
        St = [St std2(Hor) std2(Vert) std2(Diag)]; 
        S = [S skew2(Hor) skew2(Vert) skew2(Diag)]; 
        K = [K kurtosis2(Hor) kurtosis2(Vert) kurtosis2(Diag)];
        %figure(j); imagesc(Acoef);
        HorFeat{1,j} = Hor; VertFeat{1,j} = Vert; DiagFeat{1,j} = Diag; AcoefFeat{1,j} = Acoef;
    end
        
    Entropy(x,:) = H; 
    Energy(x,:) = E; Mean(x,:) = M; Var(x,:) = V; Std(x,:) = St; Skew(x,:) = S; Kurt(x,:) = K; 
    
end

Feature_Tr = [Entropy, Energy, Mean, Var, Std, Skew, Kurt];

cd([ParentFolder,'/../data/features/DWTFeatures']);
T1 = table(Entropy, Energy, Mean, Var, Std, Skew, Kurt);
writetable(T1, 'syDWT2_Tr.csv', 'WriteVariableNames', true);
cd (ParentFolder);

%% Test Wavelet Feature Extraction
Entropy_tt = []; Energy_tt = []; Mean_tt = []; Var_tt = []; Std_tt = []; Skew_tt = []; Kurt_tt = [];
 
for y = 1:Testlen
     
    cd(Test_Folder);
    Imagedir = fullfile(Test_Dir(y).name);
    SampleImage = imread(Imagedir);
    
    H_tt = []; E_tt = []; M_tt = []; V_tt = []; St_tt = []; S_tt = []; K_tt = [];
    Acoef_tt = {}; Hor_tt = {}; Vert_tt = {}; Diag_tt = {};
    k = 2; hvd = 3;
    
    DWTmethod = 'sym2';
    [c,s]=wavedec2(SampleImage,k,DWTmethod); %2d-DWT
    for j = 1:k
        [Hor_tt,Vert_tt,Diag_tt] = detcoef2('all',c,s,j);
        Acoef_tt = appcoef2(c,s,DWTmethod,j);
        cd(ParentFolder);
        H_tt = [H_tt entropy(Hor_tt) entropy(Vert_tt) entropy(Diag_tt)];
        E_tt = [E_tt energy(Hor_tt) energy(Vert_tt) energy(Diag_tt)];
        M_tt = [M_tt mean2(Hor_tt) mean2(Vert_tt) mean2(Diag_tt)];
        V_tt = [V_tt var2(Hor_tt) var2(Vert_tt) var2(Diag_tt)];
        St_tt = [St_tt std2(Hor_tt) std2(Vert_tt) std2(Diag_tt)]; 
        S_tt = [S_tt skew2(Hor_tt) skew2(Vert_tt) skew2(Diag_tt)]; 
        K_tt = [K_tt kurtosis2(Hor_tt) kurtosis2(Vert_tt) kurtosis2(Diag_tt)];
        %figure(j); imagesc(Acoef_tt);
        HorFeat{1,j} = Hor_tt; VertFeat{1,j} = Vert_tt; DiagFeat{1,j} = Diag_tt; AcoefFeat{1,j} = Acoef_tt;
    end
        
    Entropy_tt(y,:) = H_tt; Energy_tt(y,:) = E_tt; Mean_tt(y,:) = M_tt; Var_tt(y,:) = V_tt; Std_tt(y,:) = St_tt; Skew_tt(y,:) = S_tt; Kurt_tt(y,:) = K_tt; 
    
end

Feature_Tt = [Entropy_tt, Energy_tt, Mean_tt, Var_tt, Std_tt, Skew_tt, Kurt_tt];

cd([ParentFolder,'/DWTFeatures']);
T2 = table(Entropy_tt, Energy_tt, Mean_tt, Var_tt, Std_tt, Skew_tt, Kurt_tt);
writetable(T2, 'syDWT2_Tt.xls', 'WriteVariableNames', true);
cd (ParentFolder);
   
