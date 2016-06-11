function ans = Algoritmo1_3(A,b,Nmax,tol,lambda)
t_start = cputime;
count = 0;
n = length(A);

x0 = zeros(n,1);

AtA = A'*A;
sgn = zeros(n,1);

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
    
    for i = 1:n
        for j=1:20
            c(i,j) = AtA(i,j); 
            c(i,21) = bx(i); 
        end
    end
    
    % Eliminacion Gaussiana
    for i = 1:n-1;
        for j = i+1:n ;
            m = c(j,i)/c(i,i);
            c(j,:) = c(j,:)-m*c(i,:);
        end
    end
    
    x(n) = c(n,n+1)/c(n,n);
    
    % Sustitucion hacia atras    
    for i = n-1:-1:1;
        aux = 0;
        for j=i+1:n
            aux = aux+c(i,j)*x(j);
        end
        x(i) = (c(i,21)-aux)/c(i,i);
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