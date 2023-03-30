function [] = speck(p, fig, im_ref, w, h, ph)
    global var_sld
    var_lb = uilabel(fig, 'Text', 'Variance', 'Position', [w/15, 0.225*h, w/15, 22]);
    var_sld = uislider(fig, 'Value', 0.05, 'Limits', [0, 1], 'Position', [1.5*w/15, 0.25*h, w/2-2.5*w/15, 22])
    noise_btn = uibutton(fig, 'push', 'Text', 'Add', 'Position', [w/15, 0.3*h, w/2-2*w/15, 22], 'ButtonPushedFcn', @(open_btn,event) speck_add(p, fig, im_ref, var_sld, w, h, ph));
end