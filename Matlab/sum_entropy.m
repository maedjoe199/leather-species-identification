function res = sum_entropy(matrix)

    [rows, cols] = size(matrix);
    
    kg = rows;
    
% %     only if not sqaure matrix
%     kg = rows+cols + 1.5*(abs(rows-cols));

    res =0;
    for k=2:2*kg
        p = pxyk(matrix, k);
        if p > 0
            res = res - (p.*(log(p)));
        end
    end
end

