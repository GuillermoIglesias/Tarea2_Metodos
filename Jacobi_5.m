function xk = Jacobi_5(A,b,x0,tol)
t_start = cputime;
n = length(A);
count = 0;

diag_M = diag(diag(n));
diag_inv = inv(diag_M);
I = eye(n);
MJ = I-(diag_inv*A);
bJ = diag_inv*b;

xk = (MJ*x0)+bJ;

RE = max(abs(eig(MJ)));

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
    xk = (MJ*x0)+bJ;
    if count>200000
        break
    end
end

t_total = cputime-t_start;
fprintf('Radio espectral: %f\n',RE)
fprintf('Iteraciones: %f\n',count)   
fprintf('Tiempo: %f\n',t_total)  

end