function res = variance(matrix)

    [rows, cols] = size(matrix);
    
%     res = std(matrix,0,'all');
%     res = res.*res
    
    
    mu = mean(mean(matrix))
    
    res =0;
    for i=1:rows
        for j=1:cols
            res = res+(matrix(i,j)*(i-mu));
        end
    end
    res
end

