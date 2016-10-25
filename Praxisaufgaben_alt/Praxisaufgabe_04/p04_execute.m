close all;
clear; 
clc;
% Bild laden
image = imread("p04_Bild1.png");
% Bild anzeigen
figure, imshow(image);
% Bild komprimieren 8x8 Blöcke
compressedImage_8 = p04_compress(image, 8);
figure, imshow(compressedImage_8);
% Bild komprimieren 16x16 Blöcke
compressedImage_16 = p04_compress(image, 16);
figure, imshow(compressedImage_16);
% Bild dekomprimieren 8x8 Blöcke
Image_8 = p04_decompress(compressedImage_8, 8);

% Bild dekomprimieren 16x16 Blöcke
Image_16 = p04_decompress(compressedImage_16, 8);

