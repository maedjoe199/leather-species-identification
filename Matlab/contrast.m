function res = contrast(matrix)

    [rows, cols] = size(matrix);
%     https://support.echoview.com/WebHelp/Windows_and_Dialog_Boxes/Dialog_Boxes/Variable_properties_dialog_box/Operator_pages/GLCM_Texture_Features.htm
    
    res =0;
    for i=1:rows
        for j=1:cols
            res = res+(matrix(i,j) .* ((i-j)^2));
        end
    end
    res
end

