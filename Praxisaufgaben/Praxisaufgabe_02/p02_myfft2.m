function [myfftimg] = p02_myfft2(grayImage) 
  Bildmx = double(grayImage);
  
    k=size(Bildmx,1);   
    x=[1:k];

    % u and x are matrices of MxM size
    [v, u]=meshgrid(x,x);
   

    first_dft=exp(1i*(-2*pi)./k);

    % Array power Matrix with elements first_dft ((u-1).*(v-1))
    first_dft=first_dft.^((u-1).*(v-1));

    % Transpose of first_dft
    last_dft=first_dft.';        

    
    % 1D DFT matrix is first multiplied with columns and then the    
    % rows of signal matrix
    myfftimg=first_dft*Bildmx*last_dft;
 
end 