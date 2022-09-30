function glcm = saveGLCMFiles(fileName, saveAs)

    image = imread(fileName);
%     image = imcrop(image,[256 256 400 400]);
    
    glcm = graycomatrix(image,'Offset',[2 0])
  
%     saveas(marked, saveAs);
%     cd([ParentFolder,'/DWTFeatures']);
    T = table(glcm);
    writetable(T, saveAs, 'WriteVariableNames', false);
end