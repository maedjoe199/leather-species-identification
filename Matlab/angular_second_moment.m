function res = angular_second_moment(matrix)

    [rows, cols] = size(matrix);
    
    res =0;
    for i=1:rows
        for j=1:cols
            res = res+(matrix(i,j).^2);
        end
    end
    res
end

