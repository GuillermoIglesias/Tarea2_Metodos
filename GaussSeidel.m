function [x,iter,err,deltat] = GaussSeidel(A,b,x0,maxiter,tol);
t = cputime;
N = length(b);
Q = zeros(N);

for i=1:N
  Q(i:N,i) = A(i:N,i);
end;

R = inv(Q)*(Q-A);
rho = max(abs(eig(R)));

x= x0;
iter = 0;
err = norm(A*x-b,2);

while (err>tol)
    y = (Q-A)*x + b;
    xn = Q\y;
    iter = iter+1;
    x = xn;
    if (iter>=maxiter) break; end
    err = norm(A*x-b,2);
end

deltat = cputime-t;
return

