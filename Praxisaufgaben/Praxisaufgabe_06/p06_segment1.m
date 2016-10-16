clc, clear, close all;

% 1
image = imread('.\p06_Bild01.png');
figure('Name','Bild','NumberTitle','off');
imshow(image);

% 2 Histogramm
figure('Name','Histogramm','NumberTitle','off');
imhist(image);
% Interpretation: die Grauwerte im Bild sind ziemlich gleich verteilt,
% da der Hintergrund von schwarz nach weiß wechselt.
% Einzelnen Grauwerte kommen sehr häufig vor, da es Formen gibt, 
% die den gleichen Grauwerte haben.


% 3 Medianfilter(Rangordnung)
% symmetrische Randbehandlung (besseres Ergebnis als Nullen)

shader = medfilt2(image, [150, 150], 'symmetric');
figure();
imshow(shader);

rotshader = imrotate (shader, 180);
figure();
imshow(rotshader);

fixed1 = image - shader;
figure();
imshow(fixed1);

fixed2 = image + rotshader;
figure();
imshow(fixed2);

segment1 = im2bw(fixed1, 0.1);
figure();
imshow(segment1);

segment2 = im2bw(fixed2, 0.9);
figure();
imshow(segment2);

segment2co = imcomplement(segment2);
figure();
imshow(segment2co);

result = segment1 + segment2co;
figure();
imshow(result);