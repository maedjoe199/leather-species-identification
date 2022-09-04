%% Function for Skewness of an Image
function S = skew2(I);
    [X, Y] = size(I);
    m = mean2(I);
    sd = std2(I);
    S = mean2((I-m).^3)/(sd^3);
end