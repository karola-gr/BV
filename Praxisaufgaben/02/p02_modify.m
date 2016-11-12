function [img_mod] = p02_modify(img_fft,x,y)
%creates zero-matrix of size 256
img_mod = zeros(size(img_fft));
%copy the value
img_mod(x,y) = img_fft(x,y);

img_mod = ifft2(fftshift(img_mod));

end