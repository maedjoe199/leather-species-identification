function points = saveSURFFiles(fileName, saveAs)

    image = imread(fileName);
    image = imcrop(image,[256 256 400 400]);
    
    points = detectSURFFeatures(image);
%     points = detectSURFFeatures(image, 'ROI', [126 126 400 400]);
    
    imshow(image); hold on;
    marked = plot(points);
    set(marked, 'Color', 'r')
%     marked = plot(points.selectStrongest(100));

  
    saveas(marked, saveAs);
end