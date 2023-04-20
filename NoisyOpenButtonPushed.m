function [] = NoisyOpenButtonPushed(p, ph, fig, w, h)
    inp_file = uigetfile('*.jpg;*.png;*.gif;*.tif', 'Choose an input file');
    im_ref = imread(inp_file);
    if (size(im_ref, 3) < 3)
        im_ref = im_ref(:, :, [1, 1, 1]);
    end
    disp_im = uiimage(fig, 'ScaleMethod', 'stretch', 'ImageSource', im_ref, 'Position', [5*w/15, h*0.49, 5*w/15, h*5/15]);
    niqe_score = niqe(im_ref);
    piqe_score = piqe(im_ref);
    brisque_score = brisque(im_ref);

    niqe_label = uilabel(p, 'Text', 'Naturalness Image Quality Evaluator Score', 'FontSize', 15, 'Position', [w/30, 0.823*ph, 350, 22]);
    piqe_label = uilabel(p, 'Text', 'Perception-based Image Quality Evaluator Score', 'FontSize', 15, 'Position', [w/30, 0.66*ph, 350, 22]);
    brisque_label = uilabel(p, 'Text', 'Blind/Referenceless Image Spatial Quality Evaluator Score', 'FontSize', 13, 'Position', [w/30, 0.5*ph, 350, 22]);
    niqe_txt = uitextarea(p, 'Value', string(niqe_score), 'FontSize', 15, 'Position', [w*4/15, 0.823*ph, 100, 25]);
    piqe_txt = uitextarea(p, 'Value', string(piqe_score), 'FontSize', 15, 'Position', [w*4/15, 0.66*ph, 100, 25]);
    brisque_txt = uitextarea(p, 'Value', string(brisque_score), 'FontSize', 15, 'Position', [w*4/15, 0.5*ph, 100, 25]);
    add_cnr = uibutton(p, 'push', 'Position', [w/30, 0.370*ph, 350, 25], 'Text', 'Check for CNR/ENL','ButtonPushedFcn', @(open_btn,event) calc_CNR_ENL(p, w, ph, im_ref, im_ref));
end