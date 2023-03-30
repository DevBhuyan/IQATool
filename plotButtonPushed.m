function inp_file = plotButtonPushed(p, ph, fig, w, h)
    inp_file = uigetfile('*.jpg;*.png;*.gif;*.tif', 'Choose an input file');
    im_ref = imread(inp_file);
    if (size(im_ref, 3) < 3)
        im_ref = uint8(im_ref(:, :, [1, 1, 1]));
    end
    disp_im = uiimage(fig, 'ScaleMethod', 'stretch', 'ImageSource', im_ref, 'Position', [w/15, h*0.49, w/2-2*w/15, h*0.34]);

    % ADD NOISE
    noise_entry_point = uilabel(fig, 'Text', 'Add noise:', 'FontSize', 20, 'Position', [w/15, h*0.44, w/2-2*w/15, 30]);
    gauss_btn = uibutton(fig, 'push', 'Position', [2*w/30, 0.4*h, w/10, 22], 'Text', 'Gaussian Noise','ButtonPushedFcn', @(open_btn,event) gauss(p, ph, fig, w, h, im_ref));
    speckle_btn = uibutton(fig, 'push', 'Position', [6*w/30, 0.4*h, w/10, 22], 'Text', 'Speckle Noise','ButtonPushedFcn', @(open_btn,event) speck(p, fig, im_ref, w, h, ph));
    poisson_btn = uibutton(fig, 'push', 'Position', [10*w/30, 0.4*h, w/10, 22], 'Text', 'Poisson Noise','ButtonPushedFcn', @(open_btn,event) pois(im_ref, p, fig, w, h, ph));
    snp_btn = uibutton(fig, 'push', 'Position', [2*w/30, 0.355*h, w/10, 22], 'Text', 'Salt & Pepper Noise','ButtonPushedFcn', @(open_btn,event) snp(im_ref, p, fig, w, h, ph)); 
    rayleigh_btn = uibutton(fig, 'push', 'Position', [6*w/30, 0.355*h, w/10, 22], 'Text', 'Rayleigh Noise','ButtonPushedFcn', @(open_btn,event) rayleigh_driver(p, fig, w, h, ph, im_ref));
    gamma_btn = uibutton(fig, 'push', 'Position', [10*w/30, 0.355*h, w/10, 22], 'Text', 'Gamma Noise','ButtonPushedFcn', @(open_btn,event) gamma_driver(p, fig, w, h, ph, im_ref));
end
