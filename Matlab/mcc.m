function res = mcc(matrix, px, py)

    [rows, cols] = size(matrix);
    
    G = zeros(rows, cols);
    
    for i=1:rows
        for j=1:cols
            for k=1:cols
                G(i,j) = G(i,j)+((matrix(i,k).*matrix(j,k))/(px(i).*py(k)));
            end
        end
    end
    
%     E = eig(G);
%     res = sort(E);
%     res = res(size(res)-1)
    res =1;
end

