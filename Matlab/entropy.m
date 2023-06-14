function res = entropy(matrix)

    [rows, cols] = size(matrix);
    
    res =0;
    for i=1:rows
        for j=1:cols
            p = matrix(i,j);
            if p > 0
                res = res - (p.*(log(p)));
            end
        end
    end
    res
end

