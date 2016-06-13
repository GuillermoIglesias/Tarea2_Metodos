function [x,iter,error,deltat] = Jacobi(A,b,X0,maxiter,tol)
t = cputime;
[n,m] = size(A);

x = X0; 
k = 0; 
error = norm(A*x-b,2);

while error > tol & k < maxiter
      k = k+1;
      for i = 1:n
	  y(i) = (b(i) - A(i,1:i-1)*x(1:i-1) - A(i,i+1:n)*x(i+1:n))/A(i,i); 
      end
      x = y';
      error = norm(A*x-b,2);
end
iter=k;
deltat = cputime-t;
errorinf=norm(ones(n,1)-x(:,1),Inf)/norm(ones(n,1),Inf);
end

                