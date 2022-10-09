function res = imc1(matrix, px, py, HXY)

    [rows, cols] = size(matrix);
    
    HXY1 = 0;
    
    for i=1:rows
        for j=1:cols
            if matrix(i,j)>0
                HXY1 = HXY1 - matrix(i,j)*log(px(i)*py(j));
            end
        end
    end
    
    HX = entropy(px);
    HY = entropy(py);
    
    if HX>HY
        res = (HXY-HXY1)/HX;
    else 
        res = (HXY-HXY1)/HY;
    end
        
end

