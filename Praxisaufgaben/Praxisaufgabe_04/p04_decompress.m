function image = p04_decompress(compressedImage, blockSize)
m = size(compressedImage,1);
n = size(compressedImage,2);
compressedImage_8 = cell(m/blockSize,n/blockSize);
compressedImage_16 = cell(m/blockSize,n/blockSize);

% a)und b)
dec8 = cell(m/8,n/8);
for u = 1:1:m/8
    for v = 1:1:n/8
        dec8{u,v} = zagzig(rle_dec(compressedImage_8{u,v}));
    end
end
dec16 = cell(m/16,n/16);
for u = 1:1:m/16
    for v = 1:1:n/16
        dec16{u,v} = zagzig(rle_dec(compressedImage{u,v}));
    end
end
% c)
load('p04_quantm');
for u = 1:1:m/8
    for v = 1:1:n/8
        dec8{u,v} = idct2(dec8{u,v} .* quant8);
    end
end
for u = 1:1:m/16
    for v = 1:1:n/16
        dec16{u,v} = idct2(dec16{u,v} .* quant16);
    end
end

if (blockSize == 8)
  image = cell2mat(dec8);
else
   image = cell2mat(dec16);
end
end