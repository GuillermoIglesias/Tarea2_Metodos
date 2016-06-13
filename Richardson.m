function [x,iter,err,deltat] = Richardson(A,b,X0,maxiter,tol)
t = cputime;
n=length(b);
I=eye(n);
Mr=I-A

vp=eig(Mr);
vp=abs(vp);
re=max(vp);

x=zeros(n,1);
iter=1;
err = norm(A*x-b,2);

while err>=tol
    xaux=x(:,1);
    x(:,1)=(Mr)*x(:,1)+b;
    err = norm(A*x-b,2);
    iter=iter+1;
    if (iter>=maxiter) break; end;
end

deltat = cputime-t;
end
