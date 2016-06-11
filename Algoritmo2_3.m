function ans = Algoritmo2_3(A,b,Nmax,tol,lambda)
t_start = cputime;
n = length(A);
count  = 0;

AtA = (A'*A);
x0 = zeros(n,1);
sgn = zeros(n,1);

% Factorizacion LU de la matriz AT*A. 
L = zeros(n);
U = zeros(n);
for i = 1:n
    L(i,i) = 1;
    U(1,i) = AtA(1,i);
end
for i = 2:n
    L(i,1) = AtA(i,1)/U(1,1);
end
for p = 2:n
    for j = p:n
        h = 0;
        for k = 1:p-1
            h = h+L(p,k)*U(k,j);
        end
        U(p,j) = AtA(p,j)-h;
    end
    for i = p+1:n
        h = 0;
        for k = 1:p-1
            h = h+L(i,k)*U(k,p);
        end
        L(i,p) = (AtA(i,p)-h)/U(p,p);
    end
end


% Iteraciones del algoritmo
for k = 1:Nmax    
    count = count+1;
        
    % sgn(·)
    for i = 1:n
        if x0(i,1) > 0
            sgn(i,1) = 1;
        else
            sgn(i,1) = -1;
        end
    end
    
    bx = (-(A')*((A*x0)-b))-(lambda*sgn);  
            
    y = zeros(n,1);
    y(1) = bx(1)/L(1,1);
    
    for i = 1:n
        y(i) = bx(i)-L(i,1:i-1)*y(1:i-1);
        y(i) = y(i)/L(i,i);
    end
    
    x(n) = y(n)/U(n,n);
    
    for i = n-1:-1:1
        aux = 0;
        for j = i+1:n
            aux = aux+U(i,j)*x(j); 
        end
        x(i) = (y(i)-aux)/U(i,i); 
    end
    
    dif = x'-x0;
    error = norm(dif,1);
    %fprintf('Error: %f\n',error)
    
    if error < tol
        break;
    else
        x0 = x';
    end
end

t_total = cputime-t_start;
fprintf('Iteraciones: %f\n',count)   
fprintf('Tiempo: %f \n', t_total)  
ans = x'
end