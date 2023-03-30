clear
path = 'C:\Users\Asus\Documents\MATLAB\NITK Internship';
cd 'C:\Users\Asus\Documents\MATLAB\NITK Internship'
global inp_file
global im_noisy
global fig
global im_ref
global p
global entry_point
global clean_btn
global noisy_btn
set(0,'units','pixels')
pix = get(0,'screensize');
w = pix(3);
h = pix(4);

fig = uifigure('Name', 'Image Quality Metrics', 'WindowState', 'maximize');
entry_point = uilabel(fig, 'Text', 'Do you have a clean image:', 'FontSize', 20, 'Position', [12.5*w/30, 0.55*h, 350, 30]);
clean_btn = uibutton(fig, 'push', 'Position', [6*w/15, 0.50*h, w/15, 22], 'Text', 'Yes','ButtonPushedFcn', @(clean_btn,event) CleanImButtonPushed(fig, w, h));
noisy_btn = uibutton(fig, 'push', 'Position', [8*w/15, 0.50*h, w/15, 22], 'Text', 'No','ButtonPushedFcn', @(noisy_btn,event) NoisyImButtonPushed(fig, w, h));