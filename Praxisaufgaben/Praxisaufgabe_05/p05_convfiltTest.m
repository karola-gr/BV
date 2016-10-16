clear;
close;
clc;

# einlesen des Bildes
image =imread('p05_Bild01.bmp');

# Sobel-Kernel TODO: Gewichtung
sobel_x = (1/8)*[-1 0 1; -2 0 2; -1 0 1];
sobel_y = (1/8)*[-1 -2 -1; 0 0 0; 1 2 1];

# Mittelwertkernel 3x3
m_3x3 = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];

# Mittelwertkernel 7x7
m_7x7 = [1/49 1/49 1/49 1/49 1/49 1/49 1/49; 1/49 1/49 1/49 1/49 1/49 1/49 1/49; 1/49 1/49 1/49 1/49 1/49 1/49 1/49];

# Mittelwertkernel 11x11
m_11x11 = [1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121  1/121 1/121; 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121; 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121 1/121];

#1) Lineare Faltung 
t1= cputime;
# Faltung in x-Richtung
convImage1 = p05_conv2d(image, sobel_x);

# Faltung in y-Richtung 
convImage2 = p05_conv2d(image, sobel_y);
 
# Bilder addieren
convImage = (convImage1 + convImage2)/2;
figure('Name','lineare Konvolution Sobel Operator','NumberTitle','off');
imshow(convImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare lineare Konvolution Sobel Operator:');
disp(e);

# Mittelwertkernel 3x3
t1= cputime;
convImage = p05_conv2d(image,m_3x3);
figure('Name','lineare Konvolution Mittelwertkernel 3x3','NumberTitle','off');
imshow(convImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare lineare Konvolution Mittelwertkernel 3x3:');
disp(e);

# Mittelwertkernel 7x7
t1= cputime;
convImage = p05_conv2d(image,m_7x7);
figure('Name','lineare Konvolution Mittelwertkernel 7x7','NumberTitle','off');
imshow(convImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare lineare Konvolution Mittelwertkernel 7x7:');
disp(e);

# Mittelwertkernel 11x11
t1= cputime;
convImage = p05_conv2d(image,m_11x11);
figure('Name','lineare Konvolution Mittelwertkernel 11x11','NumberTitle','off');
imshow(convImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare lineare Konvolution Mittelwertkernel 11x11:');
disp(e);

#2) Filterung im Frequenzraum 

# Sobel Operator
t1= cputime;
# Faltung in x-Richtung
convImage1 = p05_filt2d(image, sobel_x);

# Faltung in y-Richtung 
convImage2 = p05_filt2d(image, sobel_y);

# Bilder addieren
convImage = (convImage1 + convImage2);
figure('Name','Filterung Frequenzraum Sobel Operator','NumberTitle','off');
imshow(convImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare Filterung Frequenzraum Sobel Operator:');
disp(e);

# Mittelwertkernel 3x3
t1= cputime;
filtImage = p05_filt2d(image,m_3x3);

figure('Name','Filterung Frequenzraum Mittelwertkernel 3x3','NumberTitle','off');
imshow(filtImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare Filterung Frequenzraum Mittelwertkernel 3x3:');
disp(e);

# Mittelwertkernel 3x3
t1= cputime;
filtImage = p05_filt2d(image,m_7x7);

figure('Name','Filterung Frequenzraum Mittelwertkernel 7x7','NumberTitle','off');
imshow(filtImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare Filterung Frequenzraum Mittelwertkernel 7x7:');
disp(e);

# Mittelwertkernel 3x3
t1= cputime;
filtImage = p05_filt2d(image,m_11x11);

figure('Name','Filterung Frequenzraum Mittelwertkernel 11x11','NumberTitle','off');
imshow(filtImage,[]);
e = cputime-t1;
disp('Berechnungszeit lineare Filterung Frequenzraum Mittelwertkernel 11x11:');
disp(e);

# Die Berechnungszeit für die Konvolution im Ortsraum ist langsamer als im Frequenzraum 
# und der 3x3 Kernel braucht immer am längsten