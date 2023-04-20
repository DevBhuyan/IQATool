function [im_noisy] = rayleigh_noise(p, fig, w, h, ph, im_ref, scale_sld)
    %Scale lies betn 0 to 10
    m = size(im_ref, 1);
    n = size(im_ref, 2);
    noise_mat = raylrnd(scale_sld.Value, m, n);
    noise_mat = noise_mat(:, :, [1, 1, 1]);
    im_ref = double(im_ref);
    im_noisy = uint8(im_ref + im_ref.*noise_mat);
    plotNoiseButtonPushed(p, fig, im_ref, im_noisy, w, h, ph)
end
