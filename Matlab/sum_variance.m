function res = sum_variance(matrix, entropy)

    [rows, cols] = size(matrix);
    
    kg = rows+cols + 1.5*(abs(rows-cols));
    
    res =0;
    for k=2:2*kg
        res = res + (pxyk(matrix, k).*((k-entropy).^2));
    end
    res
end

