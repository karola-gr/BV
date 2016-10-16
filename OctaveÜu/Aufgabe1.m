
function [graymax,graymin,groesse,aPixel, erwartungswert, standardabweichung] = p01_image_statistics (image)
  graymax = max(image(:));
  graymin = min(image(:));
  groesse = size(image);
  aPixel = groesse(1) * groesse(2);
  erwartungswert = sum(image(:))/aPixel;
  standardabweichung = std2(image);
 endfunction
 
