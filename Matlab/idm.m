function res = idm(matrix)

    [rows, cols] = size(matrix);
    
    res =0;
    for i=1:rows
        for j=1:cols
            res = res+(matrix(i,j)/(1+(i+j)^2));
        end
    end
    res
end

