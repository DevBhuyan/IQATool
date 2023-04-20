function [] = calc_CNR_ENL(p, w, ph, im_ref, im_noisy)
    %Select a homogenous area
    figure(1);
    imshow(im_noisy);
    gin = ginput(2);
    x_min = min(floor(gin(1)), floor(gin(2)));
    y_min = min(floor(gin(3)), floor(gin(4)));
    x_max = max(ceil(gin(1)), ceil(gin(2))); 
    y_max = max(ceil(gin(3)), ceil(gin(4)));
    cropped_clean = im_ref(y_min:y_max, x_min:x_max, :);
    cropped_noisy = im_noisy(y_min:y_max, x_min:x_max, :);
    figure(2);
    imshow(cropped_noisy);
    cnr_score = CNR(cropped_noisy, cropped_clean);
    enl_score = ENL(cropped_noisy);
    cnr_label = uilabel(p, 'Text', 'Contrast-to-Noise ratio', 'FontSize', 15, 'Position', [w/30, 0.16*ph, 350, 22]);
    cnr_txt = uitextarea(p, 'Value', string(cnr_score), 'FontSize', 15, 'Position', [w*4/15, 0.16*ph, 100, 25]);
    enl_label = uilabel(p, 'Text', 'Equivalent Number of Looks', 'FontSize', 15, 'Position', [w/30, 0.08*ph, 350, 22]);
    enl_txt = uitextarea(p, 'Value', string(enl_score), 'FontSize', 15, 'Position', [w*4/15, 0.08*ph, 100, 25]);
end