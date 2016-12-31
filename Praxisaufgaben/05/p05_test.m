image = imread('p05_Bild01.bmp');
kernel = [1,1,1;2,2,2;3,3,3];
imshow(p05_conv2d(image,kernel))
