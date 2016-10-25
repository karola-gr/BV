function compressedImage = p04_compress(image, blockSize)

m = size(image,1);
n = size(image,2);
compressedImage_8 = cell(m/blockSize,n/blockSize);
compressedImage_16 = cell(m/blockSize,n/blockSize);


% a) in 8x8 Blöcke
for k = 0:1:(m/blockSize-1)
    for l = 0:1:(n/blockSize-1)
        compressedImage{k+1,l+1} = image((k*blockSize+1):((k+1)*blockSize), (l*blockSize+1):((l+1)*blockSize));
    end
end

% in 16x16 Blöcke
for k = 0:1:(m/blockSize-1)
    for l = 0:1:(n/blockSize-1)
        compressedImage{k+1,l+1} = image((k*blockSize+1):((k+1)*blockSize), (l*blockSize+1):((l+1)*blockSize));
    end
end

% b) DCT jedes Blockes
DCTcompressedImage_8 = cell(m/8,n/8);
for u = 1:1:m/8
    for v = 1:1:n/8
        DCTcompressedImage_8{u,v} = dft2(compressedImage_8{u,v});
    end
end

DCTcompressedImage_16 = cell(m/16,n/16);
for u = 1:1:m/16
    for v = 1:1:n/16
        DCTcompressedImage_16{u,v} = dft2(compressedImage_16{u,v});
    end
end

% c) Quantisierung der DCT-Blöcke

load('p04_quantm');
q8 = quant8;
q16 = quant16;
DCTcompressedImage_8quant = cell(m/8,n/8);
for u = 1:1:m/8
    for v = 1:1:n/8
        DCTcompressedImage_8quant{u,v} = round(DCTcompressedImage_8{u,v}./q8);
    end
end
DCTcompressedImage_16quant = cell(m/16,n/16);
for u = 1:1:m/16
    for v = 1:1:n/16
        DCTcompressedImage_16quant{u,v} = round(DCTcompressedImage_16{u,v} ./ q16);
    end
end

% d) Umsortierung der quantisierten Koeffizienten mit der zigzag.m
ZigZag_8 = cell(m/8,n/8);
for u = 1:1:m/8
    for v = 1:1:n/8
        ZigZag_8{u,v} = zigzag(DCTcompressedImage_8quant{u,v});
    end
end

ZigZag_16 = cell(m/16,n/16);
for u = 1:1:m/16
    for v = 1:1:n/16
        ZigZag_16{u,v} = zigzag(DCTcompressedImage_16quant{u,v});
    end
end

% e) Kodierung mittels p04_rle.m
for u = 1:1:m/8
    for v = 1:1:n/8
        RLE_8{u,v} = p04_rle(ZigZag_8);
    end
end
for u = 1:1:m/16
    for v = 1:1:n/16
        RLE_16{u,v} = p04_rle(ZigZag_16);
    end
end 
% f) Rückgabe der kodierten Vektoren
if(blockSize == 8)
  compressedImage = cell2mat(RLE_8);
else 
  compressedImage = cell2mat(RLE_16);
end
end