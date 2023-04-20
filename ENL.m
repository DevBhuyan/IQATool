function [enl, m] = ENL(noisy_part)
    % input a homogenous part of the image
    noisy_part = double(noisy_part(:));
    m = mean(noisy_part);
    s = std(noisy_part);
    enl = (m^2)/(s^2);
end