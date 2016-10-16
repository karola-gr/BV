clear;
close;
clc;
image = imread('p02_Bild01.bmp');

% eingelesene Bild wird in double kovertiert
Bildmx = double(image);
% Bildmx in den Frequenzraum transformieren
myfftimg = p02_myfft2Fal(Bildmx);
% bereitgestellte Funktion zur Tranformation
ocfft = fft2(Bildmx);

figure, imshow(myfftimg);
figure, imshow(ocfft);

myfftimg = ifft2(myfftimg);
ocfft = ifft2(ocfft);

if(max(abs(imag(ocfft(:))))/max(abs(ocfft(:))) < sqrt(eps))
  newImage = real(myfftimg(:));
  figure,imshow(newImage);  
end