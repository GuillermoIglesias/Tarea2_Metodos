% n corresponde a los valores de n en el ejercicio (1b)
function ans = Hilbert_1b(n)
x = 1:n;
H = hilb(n);

% Factorizacion LU de la matriz H. 
L = zeros(n);
U = zeros(n);
for i = 1:n
    L(i,i) = 1;
    U(1,i) = H(1,i);
end
for i = 2:n
    L(i,1) = H(i,1)/U(1,1);
end
for p = 2:n
    for j = p:n
        h = 0;
        for k = 1:p-1
            h = h+L(p,k)*U(k,j);
        end
        U(p,j) = H(p,j)-h;
    end
    for i = p+1:n
        h = 0;
        for k = 1:p-1
            h = h+L(i,k)*U(k,p);
        end
        L(i,p) = (H(i,p)-h)/U(p,p);
    end
end

b = sum(H,2);
for i = 1:n 
    x = U\(L\b);
end
ans = x;

