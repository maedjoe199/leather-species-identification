function res = pxyk(matrix, k)

    [rows, cols] = size(matrix);
    
    res =0;
    if k<=rows+1
        i=k-1;
        j=1;
    else 
        i=rows;
        j=k-rows;
    end
    
    while j<cols && i>0
        res = res + matrix(i,j);
        j = j+1;
        i = i-1;
    end
end

