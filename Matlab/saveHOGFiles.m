function featureVector = saveHOGFiles(fileName, saveAs)

    image = imread(fileName);
    
%     [featureVector,hogVisualization] = extractHOGFeatures(image);
    featureVector = extractHOGFeatures(image)
    
%     figure;
%     imshow(image); 
%     hold on;
%     plot(hogVisualization);
    
    T = table(featureVector);
%     writetable(T, saveAs, 'WriteVariableNames', false);
end