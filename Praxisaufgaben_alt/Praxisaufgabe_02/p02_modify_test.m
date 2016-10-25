clear;
close;
clc;
image = imread('p02_Bild01.bmp');
A = fft2(image);
A = fftshift(A);
B = zeros(size(A));
x = round(size(image,1)/2);
y = round(size(image,2)/2);
for m = x-25: x+25
    for n = y-25: y+25
      if(sqrt((x-m)^2+ (y-n)^2) < 24) 
          B = B + p02_modify(A,m,n);
          end
     end
end    
figure,imshow (B)

%% Interpretation:
%% Wir haben leider nicht den richtigen Algorithmus gefunden, der gefordert war, aber wir vermuten, dass 
%% das Bild nach dem richtigen Algorithmus etwas unschärfer sein müsste. Da im Frequenzraum Informationen 
%% entfernt wurden.