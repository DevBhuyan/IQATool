function [] = rayleigh_driver(p, fig, w, h, ph, im_ref)
    global scale_sld
    scale_lb = uilabel(fig, 'Text', 'Scale', 'Position', [w/15, 0.225*h, w/15, 22]);
    scale_sld = uislider(fig, 'Value', 0.01, 'Limits', [0, 4], 'Position', [1.5*w/15, 0.25*h, w/2-2.5*w/15, 22]);
    noise_btn = uibutton(fig, 'push', 'Text', 'Add', 'Position', [w/15, 0.15*h, w/2-2*w/15, 22], 'ButtonPushedFcn', @(noise_btn,event) rayleigh_noise(p, fig, w, h, ph, im_ref, scale_sld));
end