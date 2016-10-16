function  myfftimg = p02_myfft2(grayImage)
  Bildmx = double(grayImage);
  N = length(Bildmx);
  if N == 1;
    myfftimg = Bildmx(1);
  else
    xe = Bildmx(1:2:(N-1));
    xo = Bildmx(2:2:N);
    ye = p02_myfft2(xe);
    yo = p02_myfft2(xo);
    D = exp(-2*pi*1j*(0:N/2-1)'/N);
    myfftimg = [ye + yo.*D; ye - yo.*D]/sqrt(2);
    end
endfunction