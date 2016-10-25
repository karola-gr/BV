function vec = p04_rld(vecRLE)
size1v = size(vecRLE,1);
size2v = size(vecRLE,2);

vec = [];
x = 0;
n = 0;
for i = 1:size2v  
  if(mod(i,2) == 0)
     n = vecRLE(1,i);
  else 
      x = vecRLE(1,i);
      n = 0;
  end
  for k = 1:n
    vec = [vec,x];
  end
end  
end

  