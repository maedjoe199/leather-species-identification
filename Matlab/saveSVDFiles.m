function U = saveSVDFiles(fileName, saveAsU,  saveAsS,  saveAsV)

    image = imread(fileName);
    [U,S,V] = svd(im2double(image));
    
    writetable(table(U), saveAsU, 'WriteVariableNames', false);
    writetable(table(S), saveAsS, 'WriteVariableNames', false);
    writetable(table(V), saveAsV, 'WriteVariableNames', false);
    
end