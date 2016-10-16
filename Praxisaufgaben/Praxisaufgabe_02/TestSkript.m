image = imread('p02_Bild01.bmp');

myfftimg = p02_myfft2(image);

out = double(image);
figure,imshow(myfftimg);
out = fftshift(out);
out2 = fft2(out);
figure,imshow(out2)

newBild = ifft2(myfftimg);
newBild = ifftshift(newBild);
figure,imshow(newBild,[]);
isequal(myfftimg,out2)