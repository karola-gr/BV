image1 = imread('./p01_Bild1.png');
image2 = imread('./p01_Bild2.png');
subplot(1,2,1)
imshow(image1)
subplot(1,2,2)
imshow(image2)

v = reshape(image2,1,(size(image2,1)*size(image2,2)));
newv1 = v(1:5000);
newv2 = v(5201:120000);
newv3 = v(120443:end);

newv = cat(2,newv1,newv2,newv3);
nimage2 = reshape(newv,[size(image1,1),size(image1,2)]);
subplot(1,2,1);
imshow(image1);
subplot(1,2,2);
imshow(nimage2);
isequal(image1,nimage2);

