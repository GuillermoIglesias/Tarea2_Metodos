% n corresponde a los valores de n en el ejercicio (1b)
function ans = Hilbert_1b(n)
x = 1:n;
H = hilb(n);
[L,U] = lu(H);
b = sum(H,2);
for i = 1:n 
    x = U\(L\b);
end
ans = x;

