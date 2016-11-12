[img_fft] = fft2(imread('p02_Bild01.tif'));
figure;

subplot(2,2,1)
[img_mod1] = p02_modify(img_fft,128+2,128+5);
imshow(100*real(img_mod1))

subplot(2,2,2)
[img_mod2] = p02_modify(img_fft,128-2,128+5);
imshow(100*real(img_mod2))

subplot(2,2,3)
[img_mod3] = p02_modify(img_fft,128-2,128-5);
imshow(100*real(img_mod3))

subplot(2,2,4)
[img_mod4] = p02_modify(img_fft,128+16,128-4);
imshow(100*real(img_mod4))


n = size(img_fft,1)/2
x = [n-20:n+20]
figure;
imshow(p02_modify(img_fft,x,x));

%{
Das angezeigte Bild ist unschärfer als das aus dem Originalbild erhaltene Bild,
sieht diesem aber noch relativ ähnlich. Dies zeigt, dass viele Informationen
in den 25x25 Pixeln rund um den Mittelpunkt des Bildes enthalten sind.
}%