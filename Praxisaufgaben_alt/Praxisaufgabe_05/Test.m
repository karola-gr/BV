function binomKernel = p05_createBinom(dim)

# eindimensionaler Binomialfilter
v_binom = [1 1];

for i = 1:dim-2
  v_binom = conv([1 1],v_binom);
  end
  
# Multiplikation des Vektors = 2D Binomialfilter
binomKernel = v_binom.' * v_binom;

end