function [] = snp_add(im_ref, dens_sld, p, fig, w, h, ph)
    im_noisy = imnoise(im_ref, 'salt & pepper', dens_sld.Value);
    plotNoiseButtonPushed(p, fig, im_ref, im_noisy, w, h, ph)
end