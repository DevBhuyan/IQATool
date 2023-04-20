clear
path = 'C:\Users\Asus\Documents\MATLAB\NITK Internship';
cd 'C:\Users\Asus\Documents\MATLAB\NITK Internship'
global inp_file
global im_noisy
global dd
global fig
global im_ref
global p
set(0,'units','pixels')
pix = get(0,'screensize');
w = pix(3);
h = pix(4);

fig = uifigure('Name', 'Image Quality Metrics', 'WindowState', 'maximize');
p = uipanel(fig, 'Title', 'Parameters', 'FontSize', 20, 'Position', [w/2, 0.05*h, 0.48*w, 0.83*h]);
ph = 0.83*h;
open_btn = uibutton(fig, 'push', 'Position', [w/15, 0.85*h, w/2-2*w/15, 22], 'Text', 'Choose a file','ButtonPushedFcn', @(open_btn,event) plotButtonPushed(p, ph, fig, w, h, inp_file));
