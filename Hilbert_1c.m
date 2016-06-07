% n corresponde al intervalo del ejercicio (1c)
function Hilbert_1c(n)
rfe = 1:length(n);
rbe = 1:length(n);
y = 1:length(n);
for i = 1:length(n)
    H = hilb(n(i));
    x = Hilbert_1b(n(i));
    xt = ones(n(i),1);
    b = sum(H,2);
    rfe(i) = norm(xt-x,inf)/norm(xt,inf);
    rbe(i) = norm(b-H*x,inf)/norm(b,inf);
    y(i) = rfe/rbe;
end
rfe
rbe
y
hold on
grid on
plot (n,rfe)
plot (n,rbe)


