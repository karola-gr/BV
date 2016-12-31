clc;

image = imread("p04_Bild1.png");
figure, imshow(image);

load('p04_quantm');

img8 = p04_compress(image,8,quant8);
img8 = p04_decompress(img8,8,quant8);
figure, imshow(img8);


img16 = p04_compress(image,16,quant16);
img16 = p04_decompress(img16,16,quant16);
figure, imshow(img16);

%{
Die Komprimierung/Dekomprimierung funktioniert scheinbar nicht.
Eine Einschätzung des Ergebnis ist somit nicht möglich.

