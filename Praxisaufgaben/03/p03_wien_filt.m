
function [img_rest] = p03_wien_filt (img_blur, psf, k)

H = fft2(psf);
fft_img_blur = fftshift(fft2(img_blur));
y_max = size(img_blur,1);
x_max = size(img_blur,2);

img_rest(1:y_max,1:x_max) = fft_img_blur(1:y_max,1:x_max).*((1./H(1:y_max,1:x_max)).*(abs(H(1:y_max,1:x_max)).^2 ./ (abs(H(1:y_max,1:x_max)).^2 + k)));
img_rest = ifft2(img_rest);
endfunction