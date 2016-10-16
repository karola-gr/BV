%% Diskrete Fouriertransformation in 1D
% Johannes Steffen

close all;
clear all;
clc;

%% Einlesen eines Bildes und Extraktion einer Bildzeile
img = im2double(imread('cameraman.tif'));

% Mittlerer Bildzeilenindex, floor: auf den nächst kleinen Integer Wert,
% falls size(img,1) ungerade
ind = floor(size(img,1)/2);
% Extraktion der ind'ten Bildzeile als diskretes 1D Signal
signal = img(ind, 1:end);
%signal = signal-mean(signal(:)); %("Gleichstrom" eleminieren)

% Visualisierung der extrahierten Zeile
figure('Name','Bild und extrahiertes 1D-Grauwertsignal');
imshow(img,[]);
hold on;
plot([1 size(img,2)], [ind ind], 'r--');
hold off;


waitforbuttonpress;


% Visualisierung des extrahierten Grauwertprofils
figure('Name','Grauwertprofil (1D-Signal)');
plot(1:numel(signal), signal);

%% Transformation des Signals in den Frequenzraum mittels Fouriertrafo
N = numel(signal);
indN = 0:N-1;
% Hilfsvariable
i2pi = 1i*2*pi;
% Basiswechselmatrix
exponent = (-i2pi/N).*(indN'*indN);
basisWechselMatrix = exp(exponent);
% Basiswechsel - Transformation
fftSignal = signal*basisWechselMatrix;


% Frage:    Geht das noch schneller?
% Antwort:  JA -> Periodizität ausnutzen! (komplex-konjugierte!)

waitforbuttonpress;
figure('Name', 'Realteil');
plot(0:numel(fftSignal)-1, real(fftSignal));
waitforbuttonpress;
figure('Name', 'Imaginärteil');
plot(0:numel(fftSignal)-1, imag(fftSignal));
waitforbuttonpress;



%% Visualisierungen im Frequenzraum
% Amplituden/Frequenz Plot
% Replizieren des Signals zur Visualisierung des Signals (3 Cycles)
fftVis = repmat(fftSignal,1,2);
figure('Name', 'Amplitudenvisualisierung');
plot(0:numel(fftVis)-1, abs(fftVis));
hold on;
plot(numel(fftSignal): 2*numel(fftSignal)-1, abs(fftSignal));
hold off;


waitforbuttonpress;

%% Schrittweise Rekonstruktion des Signals in den Ortsraum
N = numel(fftSignal);
% Definieren Abtastpunkte
p = 1/N * 2 * pi * (0:N-1);
% Rekonstruktion
rekonstruiertesSignal = zeros(1,numel(fftSignal));
drawingAngle =0:0.01:2*pi;
for u=0:N-1 %(N/2)-1
    complexFunc = fftSignal(u+1);
    % Abtastorte als Phasenarray
    abtastOrte = u*p;
    % Eigentliche Rekonstruktion
    %if u < N/2; s = 2; else s = 1; end
    trigoComp = 1/N*((real(complexFunc)*cos(abtastOrte) - imag(complexFunc)*sin(abtastOrte)));
    rekonstruiertesSignal = rekonstruiertesSignal + trigoComp;
    
    if ismember(u, [0,2,4,8,16,32,64,128,192,224,240,248,252,255])
        figure('Name', 'Rekonstruktion');
        subplot(2,1,1); plot(0:N-1,trigoComp);
        subplot(2,1,2); plot(0:N-1,signal); hold on; plot(rekonstruiertesSignal,'r--'); hold off;
        waitforbuttonpress;
    end
    
    
end







