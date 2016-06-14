function xk = Relajacion_5(A,b,w,x0,tol)
t_start = cputime;
n = length(A);
count = 0;

D = diag(diag(A));
Cl = -tril(A,-1);
Q = ((1/w)*D) - Cl;
Q_inv = inv(Q);
I = eye(n);
MRel = I-(Q_inv*A);
bRel = Q_inv*b;

xk = (MRel*x0)+bRel;

RE = max(abs(eig(MRel)));

if RE >= 1
    count = count+1;
    t_total = cputime-t_start;
    fprintf('Radio espectral: %f\n',RE)
    fprintf('Iteraciones: %f\n',count)   
    fprintf('Tiempo: %f\n',t_total)   
    return
end

while((norm(xk-x0)/norm(xk))>tol)
    count = count+1;
    x0 = xk;
    xk = (MRel*x0)+bRel;
    if count>200000
        break
    end
end

t_total = cputime-t_start;
fprintf('Radio espectral: %f\n',RE)
fprintf('Iteraciones: %f\n',count)   
fprintf('Tiempo: %f\n',t_total)  

end