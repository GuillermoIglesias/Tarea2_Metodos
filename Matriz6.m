function ans = Matriz6(n)
A = zeros(n);

% Relleno de la matriz segun el ejercicio2
for i = 1:n
    A(i,i) = 2;
    if i >= 2
        A(i,i-1) = -1;
        if i < n
            A(i,i+1) = -1;
        end
    end
end
% Relleno de los espacios faltantes
if n > 1
    A(1,2) = -1;
end



ans = A;