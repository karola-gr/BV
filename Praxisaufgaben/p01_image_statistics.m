function [greyMed, numOfPix, expec, varianz] = p01_image_statistics(image)
  greyMed = median(median(image));
  numOfPixAll = size(image,1) * size(image,2) %numOfPix in x * numOfPix in y direction
  numOfPix = numOfPixAll - sum(sum(image < 50)) - sum(sum(image > 150));
  expec = sum(image(:))/numOfPixAll;
  varianz = var(image(:));
end