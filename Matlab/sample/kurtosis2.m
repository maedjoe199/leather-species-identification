%% Function for Kurtosis of an Image
function K = kurtosis2(I);
    [X, Y] = size(I);
    m = mean2(I);
    sd = std2(I);
    K = mean2((I-m).^4)/(sd^4);
end