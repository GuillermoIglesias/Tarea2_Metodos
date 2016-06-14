function xk = Richardson_5(A,b,x0,tol)
t_start = cputime;
n = length(A);
count = 0;

I = eye(n);
MR = I-A; 
xk = (MR*x0)+b;

RE = max(abs(eig(MR)));

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
    xk = (MR*x0)+b;
    if count>200000
        break
    end
end

t_total = cputime-t_start;
fprintf('Radio espectral: %f\n',RE)
fprintf('Iteraciones: %f\n',count)   
fprintf('Tiempo: %f\n',t_total)  

end