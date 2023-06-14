%% Function for Energy of an Image
function en = energy(I)
    [X, Y] = size(I);
    en = (sum(abs(I(:)).^2))/(X*Y);
end