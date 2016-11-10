[img_fft] = fft2(imread('p02_Bild01.tif'));
figure;

subplot(2,2,1)
[img_mod1] = p02_modify(img_fft,2,5);
imshow(img_mod1)

subplot(2,2,2)
[img_mod2] = p02_modify(img_fft,-2,5);
imshow(img_mod2)

subplot(2,2,3)
[img_mod3] = p02_modify(img_fft,-2,-5);
imshow(img_mod3)

subplot(2,2,4)
[img_mod4] = p02_modify(img_fft,16,-4);
imshow(img_mod4)
