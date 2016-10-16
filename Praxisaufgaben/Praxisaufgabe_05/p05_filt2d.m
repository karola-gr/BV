function filtImage = p05_filt2d(image, kernel)
[M,N] = size(image);
[m,n] = size(kernel);

# Fouriertransformation des Bildes
fft_image = fft2(image);

# Randbehandlung, groesse des Kernels an das Bild anpassen
rand = zeros(M,N);
kernelM = floor(M/2);
kernelN = floor(N/2);

kernelm = floor(m/2);
kerneln = floor(n/2);

rand(kernelM-kernelm:kernelM+kernelm, kernelN-kerneln:kernelN+kerneln) = kernel(1:m,1:n);

# Fouriertransformation des Filterkernels
fft_kernel = fft2(fftshift(rand));

# Multiplikation im Frequenzraum
fft_filtImage = fft_image.*fft_kernel;

# Rücktransformation
filtImage = ifft2(fft_filtImage);

end