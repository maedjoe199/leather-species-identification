function res = difference_entropy(matrix)

    [rows, cols] = size(matrix);

    kg = rows;
    arr = zeros(1, kg);
    
    res=0;
    for k=0:kg-1
        arr(k+1) = pxykminus(matrix, k);
    end
    res = entropy(arr)
end

