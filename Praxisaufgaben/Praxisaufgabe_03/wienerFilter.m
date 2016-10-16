function Image = wienerFilter (I,H, k)

Image = zeros(size(I));

m = size(Image,1);
n = size(Image,2);

for u = 1: m
  for v = 1: n
    Image (u,v) = I(u,v) * ((abs(H(u,v))^2)/H(u,v)*(abs(H(u,v))^2 +k)));
   end
end

endfunction 