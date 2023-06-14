function res = correlation(matrix)

%     a = [1 2; 3 4]
%     a(:,1)
%     a(1,:)
    
    [rows, cols] = size(matrix);
    
%     mu_r = mean(matrix,2)
%     mu_c = mean(matrix)
%     sigma_r = std(matrix,0,2)
%     sigma_c = std(matrix,0,2)
%     
%     res =0;
%     for i=1:rows
%         for j=1:cols
%             res = res+(matrix(i,j)*(i-mu_r(i))*(j-mu_c(j)))/(sigma_r(i).*sigma_c(j));
%         end
%     end
    
    
    mu = mean(mean(matrix))
    sigma = std(matrix,0,'all')
    
    res =0;
    for i=1:rows
        for j=1:cols
            res = res+(matrix(i,j)*(i-mu)*(j-mu))/(sigma*sigma);
        end
    end
    res
end

