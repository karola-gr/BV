clear;
close;
clc;


image = imread('p02_Bild01.tif');
image = double(image);
[img_myfft] = p02_myfft2(image);
img_fft = fft2(image);

%display the amplitude
figure;
imagesc(100*log(1+abs(fftshift(img_fft)))); colormap(gray); 
figure;
imagesc(100*log(1+abs(fftshift(img_myfft)))); colormap(gray); 

img_myifft = ifft2(img_myfft);



max(abs(imag(img_myifft(:))))/max(abs(img_myifft(:))) < sqrt(eps)

figure;
imshow(real(img_myifft))