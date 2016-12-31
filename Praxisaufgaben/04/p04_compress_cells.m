function [img_compressed] = p04_compress_cells (image, block_size, quant)

%calculate the number of blocks needed
number_of_blocks=size(image,1)/block_size;
%get the image cells by diving it into 32x32 or 16x16 blocks
img_compressed = mat2cell(image, repmat(block_size,1,number_of_blocks),repmat(block_size,1,number_of_blocks));

%cosine-transformation
img_compressed = cellfun(@dct2, img_compressed,'UniformOutput',false);

load('p04_quantm');

%divide all the cells by the corresponding quant
if (block_size==8) %round
  img_compressed = cellfun(@(x) x./quant8, img_compressed,'UniformOutput',false);

else
  img_compressed = cellfun(@(x) x./quant16, img_compressed,'UniformOutput',false);
end

%sorting

img_compressed = cellfun(@p04_zigzag, img_compressed,'UniformOutput',false);

%encoding
img_compressed = cellfun(@p04_rle, img_compressed,'UniformOutput',false);

end
