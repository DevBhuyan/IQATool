function [] = pois(im_ref, p, fig, w, h, ph)
    im_noisy = imnoise(im_ref, 'poisson');
    plotNoiseButtonPushed(p, fig, im_ref, im_noisy, w, h, ph)
end