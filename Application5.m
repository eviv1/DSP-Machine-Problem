%% load images
image1=imread('stars-blurred.png');
psf= imread('stars-psf.png');

%% displays the given images
figure; 
imshow(image1);
title('Blurred Image');
figure;
imshow(psf);
title('psf');

%% double precision for images
image1_doubled = im2double(image1);
psf_doubled = im2double(psf);

%% normalizing PSF
psf_normalized = psf_doubled / sum(psf_doubled(:));

% deconvolve using lucy-richardson 
iteration = 150;
deconvolved_imageNW = deconvlucy(image1_doubled, psf_doubled, iteration);

%% applying windowing to the margins
[mrow, mcolumn] = size(image1_doubled);
windowed = tukeywin(mrow) * tukeywin(mcolumn)';
image1_windowed = image1_doubled .* windowed; 

%% deconvolve using lucy-richardson with window
deconvolved_image = deconvlucy(image1_windowed, psf_normalized, iteration);

%% reduce size of pixels
scale = 5;  
Deconvolved_image = imresize(deconvolved_image, scale, 'bilinear');

%% output
figure; 
imshow(deconvolved_imageNW,[]);
title('Deconvolved Image without Windowing');

figure;
imshow(deconvolved_image,[]);
title('Deconvolved Image with Windowing ');

figure;
imshow(Deconvolved_image,[]);
title('Deconvolved Image');
