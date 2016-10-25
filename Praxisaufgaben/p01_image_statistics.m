function [greyMed, numOfPix, expec, var] = p01_image_statistics(image)
  greyMed = median(median(image));
  numOfPixAll = size(image,1) * size(image,2) %numOfPix in x * numOfPix in y direction
  numOfPixHigh = size(image,1)*size(image,2)
  numOfPix = numOfPixAll - size(image>100,1)*size(image>100,2) -  size(image<50,1)*size(image<50,2)
  
  var = 0;
end