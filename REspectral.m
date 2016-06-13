function [ rho ] = REspectral( M )
sigma = eig(M);
n = size(M);
rho = 0;
for i = 1:n(1)
   if imag(sigma(i)) ==0
       if sigma(i)>rho
           rho = sigma(i);
       end
   end
end
end

