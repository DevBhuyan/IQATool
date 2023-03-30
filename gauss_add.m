function [] = gauss_add(im_ref, m_sld, var_sld, p, fig, w, h, ph)
    im_noisy = imnoise(im_ref, 'gaussian', m_sld.Value, var_sld.Value);
    plotNoiseButtonPushed(p, fig, im_ref, im_noisy, w, h, ph)
end