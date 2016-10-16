function binomKernel = p05_createBinom_alternativ(dim)
# Ich habe die Funktion ohne conv geschrieben, aber es wird trotzdem der richtige binomial Kernel erzeugt
# zuerst das pascalsche Dreieck für die Dimension aufstellen:
Matrix_pascal = pascal(dim);
[M,N] = size(Matrix_pascal);
vec2 = [];
x = 0;
# in der For-Schleife wird die Diagonale der Matrix_pascal als Zeilen-Vektor aufgestellt
for i = 1:M
     vec2 = [vec2, Matrix_pascal(M-x,i)];
     x = x+1;
end
# Zeilen-Vektor transponieren:
vec1 = vec2.';
# Binomial Kernel ist das Produkt der beiden Vektoren
binomKernel = vec1 *vec2;
end
  