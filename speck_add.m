function [] = speck_add(p, fig, im_ref, var_sld, w, h, ph)
    im_noisy = imnoise(im_ref, 'speckle', var_sld.Value)
    plotNoiseButtonPushed(p, fig, im_ref, im_noisy, w, h, ph)
end