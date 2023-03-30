function [] = gauss(p, ph, fig, w, h, im_ref)
    global m_sld
    global var_sld
    m_lb = uilabel(fig, 'Text', 'Mean', 'Position', [w/15, 0.275*h, w/15, 22]);
    var_lb = uilabel(fig, 'Text', 'Variance', 'Position', [w/15, 0.225*h, w/15, 22]);
    m_sld = uislider(fig, 'Value', 0, 'Limits', [0, 1], 'Position', [1.5*w/15, 0.3*h, w/2-2.5*w/15, 22]);
    var_sld = uislider(fig, 'Value', 0.01, 'Limits', [0, 10], 'Position', [1.5*w/15, 0.25*h, w/2-2.5*w/15, 22]);
    noise_btn = uibutton(fig, 'push', 'Text', 'Add', 'Position', [w/15, 0.15*h, w/2-2*w/15, 22], 'ButtonPushedFcn', @(noise_btn,event) gauss_add(im_ref, m_sld, var_sld, p, fig, w, h, ph));
end