function convImage = p05_conv2d(image, kernel)
# groesse des Bildes
[M,N] = size(image);
convImage = [M,N];

# Randbehandlung und groesse des Kernels an das Bild anpassen
[m,n] = size(kernel);
kernelm = floor(m/2);
kerneln = floor(n/2);
 

rand = zeros(M+2*kernelm, N+2*kerneln);
rand(kernelm+1:M+kernelm, kerneln+1:N+kerneln) = image(1:M,1:N); 

# lineare Faltung
for i = 1:M
  for j = 1:N
    convImage(i,j) = sum(sum(rand(i:i+(m-1),j:j+(n-1)).*kernel));
  end
end
end

