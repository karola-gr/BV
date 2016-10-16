function X=pmrdft21(x)
% matlab function for PM 2x1 DIT RDFT algorithm. 
% This function receives N (a power of two) real values in x, 
% computes the DFT, and returns the first (N/2)+1 DFT coeficients in X.
% The coefficients are with index from 0 to (N/2). 
% Coefficient with index (N/2) is stored in the 
% imaginary part of the coefficient with index zero 
% For the theory behind this algorithm and for more algorithms
% and DFT and related programs, please refer the book:
% The Discrete Fourier Transform, Theory, Algorithms, and Applications
% D. Sundararajan
% World Scientific, 2001
% ISBN 9810245211
%
% With input {x(n),n=0,1,...,31} of the following 32 values
% {1 8 2 5 9 4 5 7 3 1 4 4 0 0 1 7 9 9 0 8 4 2 8 4 7 4 9 1 6 6 1 0}          
% function call X=pmrdft21(x); will return {X(k),k=0,1,...,16} with 
% the following DFT coefficients of input vextor x.
% Note that X(16) is placed in the imaginary part of X(0). 
%          139 -          1i
%      -2.3456 +     11.005i
%      -5.1038 -     20.514i
%       -26.45 -     3.6839i
%       8.0711 -     7.0711i
%      -17.289 +   0.054588i
%       11.227 -     4.7206i
%      -12.779 -     14.227i
%            9 +          2i
%       7.1087 -     18.064i
%       19.886 -     18.721i
%      -12.103 +     3.2873i
%      -6.0711 -     7.0711i
%      -7.2709 +      12.72i
%      -26.009 -      6.514i
%       7.1282 -     11.661i     
%
    N=int32(2^fix(log2(length(x))));  % Number of data points, N > 15 and N is
% an integral power of 2. Otherwise, the program will truncate the data to
% make it an integral power of 2.
    if (N < int32(16))
         disp('Number of input data values must be 16 or more')
         X=[];
         return;
    else
         NB2  = (N / 2);
         NB4  = (NB2 / 2);
         NB8  = (NB4 / 2);
         NB4P1 = (NB4 + 1);
         NB8P1 = (NB8 + 1);
         xpr = x(1 : NB4); xmr = x(NB4P1 : NB2); % Data arrays
         xpi = x(NB2 + 1 : 3 * NB4); xmi = x(3 * NB4 + 1 : N);
%%%%%%%%%%%%% % twiddle factor arrays set up
         tfcos = zeros(NB8,1); tfsin = tfcos;
         arg = atan(1.0);
         d = cos(arg);
         arg = arg / (double(NB8));
         inc = arg;
         for n = 2: NB8 / 2
              k = NB8 - n + 2;
              tfsin(n) = sin(arg);
              tfcos(n) = cos(arg);
              tfsin(k) = d * (tfcos(n) - tfsin(n));
              tfcos(k) = d * (tfcos(n) + tfsin(n));
              arg = arg + inc;
         end
         n = NB8 / 2 + 1;
         tfsin(n) = sin(arg);
         tfcos(n) = cos(arg);
%%%%%%%%%%%%% vector formation and swapping of vectors
%%%%%%%%%%%%% execution of first stage of the algorithm 
         brev = - int32(NB8/2);
         p = int32(0);
         q = p;
         while (p <  NB8) 
              bit = NB8 / 2; % find bit-reversal 
              while (bit <= brev)
                   brev = brev - bit;
                   bit = bit / 2;
              end
              brev = brev + bit;
              w = p;
              r = q + brev;
              if ( w  ~= r) %  swap and add 
                   if (w > r) 
                        w = p + NB8P1; r = r + NB8P1;
                   end
                   w = w + 1; r = r + 1;  % two even indices, upper or lower half of the table
                   t1 = xpr(w); t2 = xpi(w); t3 = xmr(w); t4 = xmi(w); 
                   t5 = xpr(r); t6 = xpi(r);
                   xmr(w) = t5 - t6;
                   xpr(w) = t5 + t6;
                   t5 = xmi(r); t6 = xmr(r);
                   xmi(w) = t5 - t6;
                   t5 = t5 + t6;
                   t6 = xpr(w); xpi(w) = t6 - t5; xpr(w) =t6 + t5;
                   xmr(r) = t1 - t2; xmi(r) = t4 - t3;
                   xpr(r) = t1 + t2; t5 = t3 + t4;
                   t6 = xpr(r); xpi(r) = t6 - t5;xpr(r) = t6 + t5;
              else
                   p1 = p + 1; r = p + NB8P1 + 1; 
%two indices with the same reversals, upper and lower half of the table
                   t1 = xpr(p1); t2 = xpi(p1); t3 = xmr(p1); t4 = xmi(p1);
                   xmr(p1) = t1 - t2; xmi(p1) = t4 - t3;
                   xpr(p1) = t1 + t2; t5 = t3 + t4;
                   t6 = xpr(p1); xpi(p1) = t6 - t5; xpr(p1) = t6 + t5;
                   t1 = xpr(r); t2 = xpi(r); t3 = xmr(r); t4 = xmi(r);
                   xmr(r) = t1 - t2; xmi(r) = t4 - t3;
                   xpr(r) = t1 + t2; t5 = t3 + t4;
                   t6 = xpr(r); xpi(r) = t6 - t5; xpr(r) = t6 + t5;
              end
              p = p + 1;
              p1 = p + 1; r = q + brev + NB8 + 1;
% odd index and its reversal, lower half of the table
              t1 = xpr(p1); t2 = xpi(p1); t3 = xmr(p1); t4 = xmi(p1); 
              t5 = xpr(r); t6 = xpi(r);
              xmr(p1) = t5 - t6;
              xpr(p1) = t5 + t6;
              t5 = xmi(r); t6 = xmr(r);
              xmi(p1) = t5 - t6;
              t5 = t5 + t6;
              t6 = xpr(p1); xpi(p1) = t6 - t5; xpr(p1) =t6 + t5;
              xmr(r) = t1 - t2; xmi(r) = t4 - t3;
              xpr(r) = t1 + t2; t5 = t3 + t4;
              t6 = xpr(r); xpi(r) = t6 - t5; xpr(r) = t6 + t5;
              p  = p + 1;
         end
%%%%%%%%%% DFT computation
         q = 0; ss = int32(q + NB4); gs = int32(2);
         bs = int32(1); hbs = int32(0); inc = int32(NB8);
% outer loop stepping over stages
         while (bs < NB4)
              p = q; r = p + bs + 1;
              while ( p < ss)
                   p1 = p + 1;
%      First special butterfly
                   t2 = xmr(p1); t3 = xmi(p1);
                   xmr(p1) = xpi(p1); xmi(p1) = - xpi(r);
                   t1 = xpr(p1); t4 = xpr(r);
                   xpi(p1) = t1 - t4; xpr(p1) = t1 + t4;
                   t5 = xmr(r); t6 = xmi(r);
                   t1 = d * (t5 + t6); t4 = d * (t6 - t5);
                   xpr(r) = t2 + t1; xmr(r) = t2 - t1;
                   xpi(r) = t3 + t4; xmi(r) = t3 - t4;
                   p = p + gs; r = r + gs;
              end
              if(hbs > 0)
                   c = tfcos(NB8 / 2 + 1); s = tfsin(NB8  /2 + 1);
                   p = q + hbs; r = p + bs + 1;
                   while (p < ss )
                        p1 = p + 1;
 %       Second special buttrefly 
                        t1 =  (xpr(r) * c + xpi(r) * s);
                        t2 =  (xpi(r) * c - xpr(r) * s);
                        t3 =  (xmr(r) * s - xmi(r) * c);
                        t4 =  (xmi(r) * s + xmr(r) * c);
                        t5 = xmr(p1); t6 = xmi(p1);
                        xpr(r) = t5 + t3; xpi(r) = - (t6 + t4);
                        xmr(r) = t5 - t3; xmi(r) = t4 - t6;
                        t5 = xpr(p1); t6 = xpi(p1);
                        xmr(p1) = t5 - t1; xmi(p1) = t6 - t2;
                        xpr(p1) = t5 + t1; xpi(p1) = t6 + t2;
                        p = p + gs; r = r + gs;
                   end
              end 
 % middle loop stepping over butterflies in the first group of a stage
              xy = inc; bi = 1;xy1 = NB8 - inc;
              while(bi < hbs)
                   p = q + bi; r = p + bs + 1; w = q + bs - bi + 1; x = w + bs;
                   c = tfcos(xy + 1); s = tfsin(xy + 1); % Twiddle factors 
                   c1 = tfcos(xy1 + 1); s1 = tfsin(xy1 + 1); % Twiddle factors 
% inner loop stepping over groups of butterflies of a stage 
                   while(p < ss)
                        p1 = p + 1;
                        t1 = xmr(x); t2 = xmi(x);
                        t3 = t1 * s1 - t2 * c1; t4 = t2 * s1 + t1 * c1;
                        t1 = xpr(x); t2 = xpi(x);
                        t5 = t1 * c1 + t2 * s1; t6 = t2 * c1 - t1 * s1;
                        t7 = xmr(r); t2 = xmi(r);
                        t1 = t7 * s - t2 * c; t2 = t2 * s + t7 * c;
                        t7 = xmi(p1); xmi(x) = t2 - t7; xpi(x) = - t7 - t2;
                        t7 = xmr(p1); xmr(x) = t7 - t1; xpr(x) = t7 + t1;
                        t7 = xpr(r); t2 = xpi(r);
                        t1 = t7 * c + t2 * s; t2 = t2 * c - t7 * s;
                        t7 = xmi(w); xmi(r) = t4 - t7; xpi(r) = - t7 - t4;
                        t7 = xmr(w); xmr(r) = t7 - t3; xpr(r) = t7 + t3;
                        t7 = xpi(p1); xmi(p1) = t7 - t2; xpi(p1) = t7 + t2;
                        t7 = xpr(p1); xmr(p1) = t7 - t1; xpr(p1) = t7 + t1;
                        t7 = xpi(w); xmi(w) = t7 - t6; xpi(w) = t7 + t6;
                        t7 = xpr(w); xmr(w) = t7 - t5; xpr(w) = t7 + t5;
                        r = r + gs; w = w + gs; x = x + gs;
                        p = p + gs;
                   end
                   bi = bi + 1; xy = xy + inc;xy1 = xy1 - inc;
              end 
              hbs = bs; bs = gs;gs= gs * 2;inc = inc / 2;
         end
         X=[xpr'+ i * xpi'; [xmr(1) xmr(NB4:-1:2)]'+ i * [xmi(1) -xmi(NB4:-1:2)]'];
    end
end

 



