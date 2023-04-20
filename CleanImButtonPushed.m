function [] = CleanImButtonPushed(fig, w, h)
    global entry_point
    global clean_btn
    global noisy_btn
    delete(entry_point)
    delete(clean_btn)
    delete(noisy_btn)
    p = uipanel(fig, 'Title', 'Parameters', 'FontSize', 20, 'Position', [w/2, 0.05*h, 0.48*w, 0.42*h]);
    ph = 0.42*h;
    open_btn = uibutton(fig, 'push', 'Position', [w/15, 0.85*h, w/2-2*w/15, 22], 'Text', 'Choose a file','ButtonPushedFcn', @(open_btn,event) plotButtonPushed(p, ph, fig, w, h));
end