function ans = MatrizServidores_5(n)
A = zeros(n);

% Relleno de la matriz segun el ejercicio2
for i = 1:n
    A(i,i) = 0.3;
    if i >= 2
        A(i,i-1) = 0.2;
        if i < n
            A(i,i+1) = 0.5;
        end
    end
end
% Relleno de los espacios faltantes
if n > 1
    A(1,2) = 0.5;
end
A(1,1) = 0.5;
A(n,n) = 0.8;

A = A*A*A*A;

ans = A;