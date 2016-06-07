% n corresponde al intervalo del ejercicio (1a)
function Hilbert_1a(n) 
k = 1:length(n);
for i = 1:length(n)
    H = hilb(n(i));
    invH = inv(H);
    k(i) = norm(H,inf)*norm(invH,inf);
end
hold on
grid on
plot (n,k)
