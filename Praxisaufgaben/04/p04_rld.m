
function [vec] = p04_rld (vec_enc)

vec = [];

%each value in vec_enc (every second element in the vector)
for (pos = 1:2:size(vec_enc,2))
  %add as many values as required
  for count = 1:vec_enc(pos+1)
    vec = cat(2,vec,vec_enc(pos));
  end
  pos++;
end
%to have high values in the front
vec = fliplr(vec);
end
