function [image] = p04_decompress (img_compressed, block_size, quant)

img_compressed = cellfun(@(x) p04_rld(x), img_compressed, 'UniformOutput', false);
img_compressed = cellfun(@(x) p04_zagzig(x), img_compressed, 'UniformOutput', false);
img_compressed = cellfun(@(x) round(x.*quant), img_compressed, 'UniformOutput', false);
img_compressed = cellfun(@(x) idct2(x), img_compressed, 'UniformOutput', false);

image = cell2mat(img_compressed);

end
