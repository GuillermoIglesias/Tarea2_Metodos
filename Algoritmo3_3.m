function ans = Algoritmo3_3(A,b,Nmax,tol,lambda)
t_start = cputime;
n = length(A);
count  = 0;

AtA = (A'*A);
x0 = zeros(n,1);
sgn = zeros(n,1);

% Comprobacion para hacer Cholesky
if AtA ~= AtA'
    disp('Matriz no es simetrica');
    return
end
VP = eig(AtA);
minimoVP = min(VP);
if minimoVP < 0
    disp('Matriz no es definida positiva')
    return
end

% Si es posible hacer Cholesky
L = zeros(n);
s = 0;
for i = 1:n
    sd = 0;
    for k = 1:i-1
        sd = sd + (L(i,k))^2;
    end
    L(i,i) = sqrt((AtA(i,i)-sd));
    for j = i+1:n
        for k = 1:i-1
            s = (L(j,k)*L(i,k));
        end
        L(j,i) = (AtA(j,i)-s)/(L(i,i));
    end
end
Lt = L';

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
    
    x(n) = y(n)/Lt(n,n);
    
    for i = n-1:-1:1
        aux = 0;
        for j = i+1:n
            aux = aux+Lt(i,j)*x(j); 
        end
        x(i) = (y(i)-aux)/Lt(i,i); 
    end
    
    dif = x'-x0;
    error = norm(dif,1);
    fprintf('Error: %f\n',error)
    
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