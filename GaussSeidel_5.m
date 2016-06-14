function xk = GaussSeidel_5(A,b,x0,tol)
t_start = cputime;
n = length(A);
count = 0;

Q = tril(A);
Q_inv = inv(Q);
I = eye(n);
MG = I-(Q_inv*A);
bG = Q_inv*b;

xk = (MG*x0)+bG;

RE = max(abs(eig(MG)));

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
    xk = (MG*x0)+bG;
    if count>200000
        break
    end
end

t_total = cputime-t_start;
fprintf('Radio espectral: %f\n',RE)
fprintf('Iteraciones: %f\n',count)   
fprintf('Tiempo: %f\n',t_total)  

end