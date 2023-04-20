function enl = ENLOne()
    input_name = 'C:\Users\Asus\Documents\MATLAB\NITK Internship\ECE DEPT.jpg'
    dir_name = 'C:\Users\Asus\Documents\MATLAB\NITK Internship\';
     % Pls note the format of files,change it as required
    original_files=dir([dir_name '/*.jpg']);
    orig_img = imread(input_name);
    imshow(orig_img)
    %49:137,50:100,:
    %h = drawrectangle('Position',[315,82,336-315,94-82],'Label','R1');
    % i =  drawrectangle('Position',[384,352,428-384,374-352],'Label','R2');
    % j=  drawrectangle('Position',[158,278,291-158,308-278],'Label','R3');
    % k=  drawrectangle('Position',[170,232,299-170,263-232],'Label','R4');
    %imwrite(orig_img,"aerial2_with_roi.png");
    %upper left 105:192,106:196,:
     %upper right 103:195,315:411,:
     %bottom left 315:408,104:196,:
     %bottom right 315:405,319:408,:
    %a2p3: 192:199,178:214,: , 419:434,31:44,: ,   35:49,409:419,:
     %8:77,487:500,:
     %For SAR3
     %276:297,265:268,:
     %10:61,460:479,:
     for k=1:length(original_files)
        filename=[dir_name '/' original_files(k).name];
        %file-load statement here % Load file
        %Next do your operation and finding
        img = imread(filename);
        figure(k),imshow(img);
        rest_R1 = img(10:61,460:479,:);
        noisy_R1 = orig_img(10:61,460:479,:);
        figure(3); image(rest_R1); axis image
        calculate_enl(rest_R1,filename)
        calculate_cnr(noisy_R1,rest_R1,filename);
        imshow(rest_R1);
        close(figure(k));
        close(figure(3))
     end
     function enl= calculate_enl(R1,filename)
        R1=double(R1(:));
        mean(R1);
        enl=(mean(R1)^2)/(std(R1)^2);
        fprintf('%s,%f\n',filename,enl);
     end
     function cnr= calculate_cnr(noisy_R1,rest_R1,filename)
        r1=double(noisy_R1(:));
        r2 = double(rest_R1(:));
        %r1 (noisy_R1-min(noisy_R1(:)))/(max(noisy_R1(:))-min(noisy_R1(:)))
        %r2 = (rest_R1-min(rest_R1:)))/(max(rest_R1(:))-min(rest_R1(:)))
        cnr=abs(mean(r1)-mean(r2))/sqrt(((std(r1)^2)+(std(r2)^2))/2);
        fprintf('%s,%f\n',filename,cnr);
     end
end