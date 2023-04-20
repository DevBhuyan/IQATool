function [] = snp(im_ref, p, fig, w, h, ph)
    global dens_sld
    dens_lb = uilabel(fig, 'Text', 'Density', 'Position', [w/15, 0.275*h, w/15, 22]);
    dens_sld = uislider(fig, 'Value', 0.05, 'Limits', [0, 1], 'Position', [1.5*w/15, 0.3*h, w/2-2.5*w/15, 22]);
    noise_btn = uibutton(fig, 'push', 'Text', 'Add', 'Position', [w/15, 0.15*h, w/2-2*w/15, 22], 'ButtonPushedFcn', @(open_btn,event) snp_add(im_ref, dens_sld, p, fig, w, h, ph));
end