function res = get_GLCM_property(property, normalised, sumEntropy, px, py, HXY)
    
    if property == "angular_second_moment"
        res = angular_second_moment(normalised);
    elseif property == "contrast"
        res = contrast(normalised);
    elseif property == "correlation"
        res = correlation(normalised);
    elseif property == "variance"
        res = variance(normalised);
    elseif property == "idm"
        res = idm(normalised);
    elseif property == "sum_average"
        res = sum_average(normalised);
    elseif property == "sum_variance"
        res = sum_variance(normalised, sumEntropy)
    elseif property == "sum_entropy"
        res = sumEntropy;
    elseif property == "entropy"
        res = entropy(normalised);
    elseif property == "difference_variance"
        res = difference_variance(normalised);
    elseif property == "difference_entropy"
        res = difference_entropy(normalised);
    elseif property == "information_measure_of_correlation_1"
        res = imc1(normalised, px, py, HXY);
    elseif property == "information_measure_of_correlation_2"
        res = imc2(normalised, px, py, HXY);
    elseif property == "maximal_correlation_coefficients"
        res = maximal_correlation_coefficients(normalised, px, py);
    end
end