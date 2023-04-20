function [cnr] = CNR(noisy_part, clean_part)
    r1 = double(noisy_part(:));
    r2 = double(clean_part(:));
    m1 = mean(r1);
    m2 = mean(r2);
    s1 = std(r1);
    s2 = std(r2);
    cnr = abs(m1-m2)/sqrt((s1^2)+(s2^2)+0.000001);
end