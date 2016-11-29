clear; close; clc;


img_blur = imread('p03_Bild1.png');
figure();
img_blur = im2double(img_blur);
imshow(img_blur)


y_middle = floor(size(img_blur,1)/2);
x_middle = floor(size(img_blur,2)/2);
psf = zeros(size(img_blur));
%creating psf with 17px length
psf(y_middle,x_middle-8:x_middle+8) = 1;

%rotate the psf by 135°
psf = imrotate(psf, 135, 'bilinear', 'crop');

%transform image and psf
fft_img_blur = fftshift(fft2(img_blur));
fft_psf = fft2(psf);
%Hinweis 1: Achten Sie darauf, dass die Fourierkoordinatensysteme der Punk-
%tantwort und des fouriertransformierten Bildes übereinstimmen.


%get the corrected_image by dividing the blurred one through the psf
y_max = y_middle*2;
x_max = x_middle*2;
corrected_image(1:y_max,1:x_max) =  fft_img_blur(1:y_max,1:x_max)./fft_psf(1:y_max,1:x_max);
figure();
imshow(ifft2(corrected_image))

%{
Das Bild wurde leider nicht erfolgreich rekonstruiert. 
Der Fehler konnte auch durch verschiedene Tests nicht gefunden werden.
Theoretisch sollte die Bewegungsunschärfe neutralisiert werden
%}

figure();
k = 0.01;
imshow(p03_wien_filt(img_blur, psf, k))

%{
Bei einem kleinen k sollte das Bild gut restauriert werden, wird aber
sehr verrauscht.
Je höher das k, desto geglätteter werden die Kanten.
%}