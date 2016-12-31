function [img_compressed] = p04_compress_cells (image, block_size, quant)

m = size(image,1);
n = size(image,2);
img_compressed = cell(m/block_size-1,n/block_size-1);

if(block_size==8)
  for k = 1:(m/block_size-1)
    for l = 1:(n/block_size-1)
        img_compressed{k,l} = image(((k-1)*block_size+1):(k*block_size),((l-1)*block_size+1):(l*block_size));
    end
  end
end

img_compressed = cellfun(@(x) dct2(x), img_compressed, 'UniformOutput', false);
img_compressed = cellfun(@(x) round(x./quant), img_compressed, 'UniformOutput', false);
img_compressed = cellfun(@(x) p04_zigzag(x), img_compressed, 'UniformOutput', false);
img_compressed = cellfun(@(x) p04_rle(x), img_compressed, 'UniformOutput', false);

%calculate the compression rate
original_size = m*n;
compressed_size = 0;
%compressed_size = cellfun(@(x) compressed_size+=size(x,2), img_compressed, 'UniformOutput', false);
for k = 1:(m/block_size-1)
    for l = 1:(n/block_size-1)
      compressed_size+=size(img_compressed{k,l},2);
    end
end
compression_rate = compressed_size/original_size

end
