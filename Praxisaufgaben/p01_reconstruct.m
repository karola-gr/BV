image1 = imread('./p01_Bild1.png');
image2 = imread('./p01_Bild2.png');
% subplot(m,n,p) m x n grid, position
subplot(1,2,1)
imshow(image1)
subplot(1,2,2)
imshow(image2)

%transform image matrix to vector
vector = reshape(image2, 1, (size(image2, 1) * size(image2, 2)));

%cut out the black and white pixel
part1 = vector(1:5000);
part2 = vector(5201:120000);
part3 = vector(120443:end);

%concatenate the parts
concatenated = cat(2,part1,part2,part3);

%reshape the concatenated pixel to the dimensions of the original
correctedImage = reshape(concatenated, [size(image1,1), size(image1,2)]);

subplot(1,2,1)
imshow(image1)
subplot(1,2,2)
imshow(correctedImage)
isequal(image1,correctedImage)