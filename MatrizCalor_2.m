function ans = MatrizCalor_2(n)
A = zeros(n);

% Relleno de la matriz segun el ejercicio2
for i = 1:n
    A(i,i) = -4;
    if i >= 2
        A(i,i-1) = 1;
        if i < n
            A(i,i+1) = 1;
        end
    end
    if i >= 4
        A(i,i-3) = 1;
        if i < n-2
            A(i,i+3) = 1;
        end
    end
end
% Relleno de los espacios faltantes
if n > 1
    A(1,2) = 1;
    if n > 3
        A(1,4) = 1;
        if n > 4
            A(2,5) = 1;
            if n > 5
                A(3,6) = 1;
            end
        end
    end
end

ans = A;

