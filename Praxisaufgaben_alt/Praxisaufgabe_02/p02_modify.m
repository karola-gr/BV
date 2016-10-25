function [B] = p02_modify(A,x,y)
B = zeros(size(A));
B(x,y) = A(x,y);
B = ifftshift(B);
B = ifft2(B);
end