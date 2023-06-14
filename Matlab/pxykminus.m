function res = pxykminus(matrix, k)

    [rows, cols] = size(matrix);
    
    res =0;
    for j=1:cols
        if j-k>0
            res = res + matrix(j-k,j);
        end
        if j+k<=rows
            res = res + matrix(j+k,j);
        end
    end
end

