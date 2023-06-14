function res = imc2(matrix, px, py, HXY)

    [rows, cols] = size(matrix);
    
    HXY2 = 0;
    
    for i=1:rows
        for j=1:cols
            if px(i)*py(j)>0
                HXY2 = HXY2 - px(i)*py(j)*log(px(i)*py(j));
            end
        end
    end
    
    res = (1 - exp(-2 * (HXY2 - HXY))).^0.5;
        
end

