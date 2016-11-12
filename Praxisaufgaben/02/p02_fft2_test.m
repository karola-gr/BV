clear;
close;
clc;

image = imread('p02_Bild01.tif');
image = double(image);
[img_myfft] = p02_myfft2(image);
img_fft = fft2(image);

%display the amplitude
figure;
subplot(1,2,1)
imagesc(100*log(1+abs(fftshift(img_fft)))); colormap(gray); 
subplot(1,2,2)
imagesc(100*log(1+abs(fftshift(img_myfft)))); colormap(gray); 

img_myifft = ifft2(img_myfft);
img_ifft = ifft2(img_fft);

%this checks the transformation
max(abs(imag(img_myifft(:))))/max(abs(img_myifft(:))) < sqrt(eps)


figure;
subplot(1,2,1)
imshow(uint8(real(img_myifft)))
subplot(1,2,2)
imshow(uint8(real(img_ifft)))