function vecRLE = p04_rle(vec)
size1v = size(vec,1);
size2v = size(vec,2);
if( size1v > size2v)
  vec = vec';
end
x = vec(1,1);
count = 1;

vecRLE = [];
for i = 2:size2v  
  if( x == vec(1,i));
    count++;   
  else
    vecRLE = [vecRLE, x , count];   
    x = vec(1,i);
    count = 1;
    end
end
vecRLE = [vecRLE, x , count];
end