function out = plotNoiseButtonPushed(p, fig, im_ref, im_noisy, w, h, ph)
    niqe_score = niqe(im_noisy);
    piqe_score = piqe(im_noisy);
    brisque_score = brisque(im_noisy);
    niqe_label = uilabel(fig, 'Text', 'NIQE Score', 'FontSize', 15, 'Position', [w/15, 0.11*h, (w/2-2*w/15)/6, 25]);
    piqe_label = uilabel(fig, 'Text', 'PIQE Score', 'FontSize', 15, 'Position', [w/8+w/15, 0.11*h, (w/2-2*w/15)/6, 25]);
    brisque_label = uilabel(fig, 'Text', 'BRISQUE Score', 'FontSize', 15, 'Position', [w/4+w/15, 0.11*h, (w/2-2*w/15)/6, 25]);
    niqe_txt = uitextarea(fig, 'Value', string(niqe_score), 'FontSize', 15, 'Position', [(w/2-2*w/15)/6+w/15, 0.11*h, (w/2-2*w/15)/6, 25]);
    piqe_txt = uitextarea(fig, 'Value', string(piqe_score), 'FontSize', 15, 'Position', [(w/2-2*w/15)/6+w/8+w/15, 0.11*h, (w/2-2*w/15)/6, 25]);
    brisque_txt = uitextarea(fig, 'Value', string(brisque_score), 'FontSize', 15, 'Position', [(w/2-2*w/15)/6+w/4+w/15, 0.11*h, (w/2-2*w/15)/6, 25]);
    
    disp_im_noisy = uiimage(fig, 'ScaleMethod', 'stretch', 'Position', [8*w/15, h*0.49, w/2-2*w/15, h*0.34]);
    disp_im_noisy.ImageSource = im_noisy;
    % IQA PARAMS
    im_ref = uint8(im_ref);
    im_noisy = uint8(im_noisy);

    mse_score = immse(im_noisy, im_ref);
    [psnr_score, snr_score] = psnr(im_noisy, im_ref);

    R = im_ref(:, :, 1);
    G = im_ref(:, :, 2);
    B = im_ref(:, :, 3);
    R_noisy = im_noisy(:, :, 1);
    G_noisy = im_noisy(:, :, 2);
    B_noisy = im_noisy(:, :, 3);
    R_ssim_score = ssim(R_noisy, R);
    G_ssim_score = ssim(G_noisy, G);
    B_ssim_score = ssim(B_noisy, B);
    ssim_score = (R_ssim_score+G_ssim_score+B_ssim_score)/3;
    R_ms_ssim_score = multissim(R_noisy, R);
    G_ms_ssim_score = multissim(G_noisy, G);
    B_ms_ssim_score = multissim(B_noisy, B);
    ms_ssim_score = (R_ms_ssim_score+G_ms_ssim_score+B_ms_ssim_score)/3;

    % PRINT LABELS
    mse_label = uilabel(p, 'Text', 'Mean-Squared Error', 'FontSize', 15, 'Position', [w/30, 0.85*ph, 250, 22]);
    psnr_label = uilabel(p, 'Text', 'Peak Signal-to-Noise ratio', 'FontSize', 15, 'Position', [w/30, 0.74*ph, 250, 22]);
    snr_label = uilabel(p, 'Text', 'Signal-to-Noise ratio', 'FontSize', 15, 'Position', [w/30, 0.62*ph, 250, 22]);

    ssim_label = uilabel(p, 'Text', 'Structural-Similarity(SSIM) Score', 'FontSize', 15, 'Position', [w/30, 0.50*ph, 250, 22]);

    ms_ssim_label = uilabel(p, 'Text', 'Multiscale Structural-Similarity(MS-SSIM) Score', 'FontSize', 15, 'Position', [w/30, 0.375*ph, 320, 22]);

    % DISPLAY IQA PARAMS
    mse_txt = uitextarea(p, 'Value', string(mse_score), 'FontSize', 15, 'Position', [w*4/15, 0.85*ph, 100, 25]);
    psnr_txt = uitextarea(p, 'Value', string(psnr_score), 'FontSize', 15, 'Position', [w*4/15, 0.74*ph, 100, 25]);
    snr_txt = uitextarea(p, 'Value', string(snr_score), 'FontSize', 15, 'Position', [w*4/15, 0.62*ph, 100, 25]);

    ssim_txt = uitextarea(p, 'Value', string(ssim_score), 'FontSize', 15, 'Position', [w*4/15, 0.50*ph, 100, 25]);
    ms_ssim_txt = uitextarea(p, 'Value', string(ms_ssim_score), 'FontSize', 15, 'Position', [w*4/15, 0.375*ph, 100, 25]);
    
    add_cnr = uibutton(p, 'push', 'Position', [w/30, 0.25*ph, 350, 25], 'Text', 'Check for CNR/ENL','ButtonPushedFcn', @(open_btn,event) calc_CNR_ENL(p, w, ph, im_ref, im_noisy));
end
