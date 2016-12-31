function [vec_enc] = p04_rle(vec)

count = 0;
vec_enc = [];

%check all values
for value = 0:200
  %check every position in the given vector
  for pos = 1:size(vec,2)
    if (value == vec(pos))
      %count the number of pixel with the value
      count++;
    end
  end
  if (count > 0)
    %add the value and the count to the array
    vec_enc = cat(2,vec_enc,value,count);
  end
  count = 0;
  
  if(value!=0)
  %again for the negative value
  for pos = 1:size(vec,2)
    if (-value == vec(pos))
      %count the number of pixel with the value
      count++;
    end
  end
  if (count > 0)
    vec_enc = cat(2,vec_enc,-value,count);
  end
  count = 0;
  end 
end 
end