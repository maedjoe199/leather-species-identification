function res = difference_variance(matrix)

    [rows, cols] = size(matrix);
    
% %     if not square matrix
%     kg = rows+cols + 1.5*(abs(rows-cols));

    kg = rows;
    arr = zeros(1, kg);
    
    for k=0:kg-1
        arr(k+1) = pxykminus(matrix, k);
    end
    res = var(arr)
end

