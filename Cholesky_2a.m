function ans = Cholesky_2a(A)
%Comprobacion para hacer Cholesky
if A ~= A'
    disp('Matriz no es simetrica');
    return
end
VP = eig(A);
minimoVP = min(VP);
if minimoVP < 0
    disp('Matriz no es definida positiva')
    return
end

%Si es posible hacer Cholesky
L = zeros(length(A));
s = 0;
for i = 1:length(A)
    sd = 0;
    for k = 1:i-1
        sd = sd + (L(i,k))^2;
    end
    L(i,i) = sqrt((A(i,i)-sd));
    for j = i+1:length(A)
        for k = 1:i-1
            s = (L(j,k)*L(i,k));
        end
        L(j,i) = (A(j,i)-s)/(L(i,i));
    end
end
L
Lt = L'