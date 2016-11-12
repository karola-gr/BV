function [img_myfft] = p02_myfft2(img) 
    img = double(img);

    n=size(img,1);   % =256
    dft=exp(1i*(-2*pi)./n);
    
    x=[1:n];
   
    %this replaces the sums in the equation
    [v,u]=meshgrid(x,x);
   
    dft=dft.^((u-1).*(v-1));
    img_myfft=dft*img*dft.';

end