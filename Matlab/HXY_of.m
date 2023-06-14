function res = HXY_of(matrix)

    [rows, cols] = size(matrix);
    
    res = 0;
    
    for i=1:rows
        for j=1:cols
            if matrix(i,j)>0
                res = res - matrix(i,j)*log(matrix(i,j));
            end
        end
    end 
end

