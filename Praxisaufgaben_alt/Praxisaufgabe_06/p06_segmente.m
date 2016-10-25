# 1
image = imread('.\p06_Bild01.png');
figure('Name','Bild','NumberTitle','off');
imshow(image);

# 2 Histogramm
figure('Name','Histogramm','NumberTitle','off');
imhist(image);
# Interpretation: die Grauwerte im Bild sind ziemlich gleich verteilt,
# da der Hintergrund von schwarz nach weiß wechselt.
# Einzelnen Grauwerte kommen sehr häufig vor, da es Formen gibt, 
# die den gleichen Grauwerte haben.

