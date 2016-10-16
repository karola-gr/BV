clear;
close;
clc;
%1)
image = imread('p03_Bild1.png');
%figure, imshow(image);

%2)Punktantwort 
psfI = zeros(size(image));
hy = size(image,1)/2;
hx = size(image,2)/2;
for z = hx-8: hx+8
  psfI(hy,z) = 1;
 end 
psfI = imrotate(psfI, 135, 'bilinear','crop');
%figure, imshow(psfI);

%3)
fftimage = fft2(image);
fftimage = fftshift(fftimage);
fftpsfI = fft2(psfI);

%4)
newI = zeros(size(image));
for k=1:348
    for l=1:600
        newI(k,l) = fftimage(k,l)/fftpsfI(k,l);
    end
end
newI = ifft2(ifftshift(newI));

figure, imshow(abs(newI),[]);

%5)wienerFilter
%psfI -> PointSpreedFunction
H = (fft2(psfI));

image = im2double(image);
newImage = im2double(zeros(size(image)));
image = fftshift(fft2(image));
m = size(newImage,1);
n = size(newImage,2);
k = 0.00001;
for u = 1: m
  for v = 1: n
    newImage (u,v) = image(u,v)*((1/H(u,v))*((abs(H(u,v))^2)/(abs(H(u,v))^2 +k)));
   end
end
newImage = ifftshift(newImage);
figure, imshow(ifft2(newImage),[]);

% Interpretation von k
% wenn k = 0 hat man die Inverse Filterung
% umso größer k wird umso unschärfer wird das Bild und umso kleiner das k wird umso mehr Rauschen ist im Bild