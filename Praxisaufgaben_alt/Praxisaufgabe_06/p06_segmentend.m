clc, clear, close all;

% Aufgabe 1 Bild einlesen und anzeigen
image = imread('.\p06_Bild01.png');
figure('Name','Bild','NumberTitle','off');
imshow(image);

% Aufgabe 2 Histogramm
figure('Name','Histogramm','NumberTitle','off');
imhist(image);
% Interpretation: die Grauwerte im Bild sind ziemlich gleich verteilt,
% da der Hintergrund von schwarz nach weiﬂ wechselt.
% Einzelnen Grauwerte kommen sehr h‰ufig vor, da es Formen gibt, 
% die den gleichen Grauwert haben.


% Aufgabe 3 Medianfilter(Rangordnung)

% symmetrische Randbehandlung (besseres Ergebnis als Nullen)

shader = medfilt2(image, [80, 80], 'symmetric');
figure();
imshow(shader);

% der Shader um 180∞ rotiert. Damit ergibt sich ein beinahe weiﬂes Bild,
% wenn man beide Hintergr¸nde(image und rotshader) addiert, sodass sich nur
% noch Objekte im Vordergrund abheben, die relativ dunkel sind 
rotshader = imrotate (shader, 180);
figure();
imshow(rotshader);

% Hintergrund wird vom Bild abgezogen, helle Objekte im dunklen Bereich
% bleiben erhalten
fixed1 = image - shader;
figure();
imshow(fixed1);

% Hintergrund, um 180∞ rotiert, wird zum Bild addiert (siehe oben), dadurch
% ergibt sich der weiﬂe Hintergrund und dunkle Objekte im hellen Bereich
% bleiben erhalten
fixed2 = image + rotshader;
fixed2corner = im2uint8(ones(size(image)));
fixed2corner(1:45,1:45) = fixed2(1:45,1:45);
figure();
imshow(fixed2);



% Aufgabe 4 Segmentierung und Bin‰rbild

% Bin‰rbild aus fixed1, d.h. Objekte werden weiﬂ, Hintergrund schwarz
segment1 = im2bw(fixed1, 0.08);
figure();
imshow(segment1);

% Bin‰rbild aus fixed2, d.h. Objekte werden schwarz, Hintergrund weiﬂ
segment2corner = im2bw(fixed2corner, 0.9725);
segment2 = im2bw(fixed2, 0.92);
figure();
imshow(segment2);


% 2. Bin‰rbild wird an das 1. Bin‰rbild angepasst, sodass bei beiden die
% Objekte weiﬂ und Hintergrund schwarz sind, indem Komplement des Bildes
% genutzt wird
segment2co = imcomplement(segment2);
segment2cornerco = imcomplement(segment2corner);
segment2co = segment2co + segment2cornerco;
figure();
imshow(segment2co);

% Beide Teilergebnisse werden zu einem Bild vereint.
result = segment1 + segment2co;
figure();
imshow(result);