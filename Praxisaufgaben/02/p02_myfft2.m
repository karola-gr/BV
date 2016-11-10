function [img_myfft] = p02_myfft2(img) 
    img = double(img);

    k=size(img,1);   % =256
    %first part of the equation
    dft=exp(1i*(-2*pi)./k);
    
    x=[1:k];
    % u and v are matrices of MxM size
    %this replaces the sums in the equation
    [v,u]=meshgrid(x,x);
   
    % Array power Matrix with elements first_dft ((u-1).*(v-1))
    dft=dft.^((u-1).*(v-1));

    % 1D DFT matrix is first multiplied with columns and then the    
    % rows of signal matrix
    img_myfft=dft*img*dft.';

end