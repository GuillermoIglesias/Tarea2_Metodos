% n corresponde a los valores de n en el ejercicio (2b)
function GraficarCondicion_2b(n)
k = 1:length(n);
for i = 1:length(n)
    A = MatrizCalor_2(n(i));
    invA = inv(A);
    k(i) = norm(A,inf)*norm(invA,inf);
end
hold on
grid on
plot (n,k)
