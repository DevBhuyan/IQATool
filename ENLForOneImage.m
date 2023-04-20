function [] = ENLForOneImage()
    clean_input ='C:\Users\Asus\Documents\MATLAB\NITK Internship\ECE DEPT.jpg';
    noisy_input = 'C:\Users\Asus\Documents\MATLAB\NITK Internship\ECE DEPT.jpg';
    clean_img = imread(clean_input);
    noisy_img = imread(noisy_input);
%     figure(1), imshow(img);
    
%     p = ginput(2) ; 
%     sp(1) = min(floor(p(1)), floor(p(2))); %xmin
%     sp(2) = min(floor(p(3)), floor(p(4))); %ymin
%     sp(3) = max(ceil(p(1)), ceil(p(2)));   %xmax
%     sp(4) = max(ceil(p(3)), ceil(p(4)));   %ymax
    % Cropped Image
%     MM = img(sp(2):sp(4), sp(1): sp(3),:);
%     NN = orig_img(sp(2):sp(4),sp(1):sp(3),:);
    %Display the subsetted image with appropriate axis ratio
%     figure(2); image(MM); axis image
%     imshow(MM);

    MM = noisy_img;
    NN = clean_img;
    calculate_enl(MM,noisy_input);
    calculate_cnr(MM,NN,noisy_input);

    function enl = calculate_enl(MM,filename)
        % input a homogenous part of the image
        MM = double(MM(:));
        m = mean(MM);
        s = std(MM);
        enl = (m^2)/(s^2);
        fprintf('%s\nENL: %f\nmean: %f\n', filename, enl, m);
    end

    function cnr= calculate_cnr(noisy_R1,rest_R1,filename)
        r1 = double(noisy_R1(:));
        r2 = double(rest_R1(:));
        %r1 (noisy_R1-min(noisy_R1(:)))/(max(noisy_R1(:))-min(noisy_R1(:)))
        %r2 = (rest_R1-min(rest_R1(:)))/(max(rest_R1(:))-min(rest_R1(:)))
        %r1 = im2double(noisy_R1)
        %r2 = im2double(rest_R1)
        m1 = mean(r1);
        m2 = mean(r2);
        s1 = std(r1);
        s2 = std(r2);
        cnr = abs(m1-m2)/sqrt((s1^2)+(s2^2)+0.000001);
        fprintf('%s\nCNR: %f\n',filename,cnr);
    end
end