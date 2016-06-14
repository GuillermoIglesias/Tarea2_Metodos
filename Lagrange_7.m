function ans = Lagrange_7(a,b)
n = length(a);
syms x;
for j = 1:n
    factor1 = 1;
    for i = 1:j-1
         factor1 = factor1*(x-a(i)); 
    end
         factor2 = 1;
    for i = j+1:n
         factor2 = factor2*(x-a(i)); 
    end
         factor3 = 1;
    for i = 1:j-1
         factor3 = factor3*(a(j)-a(i)); 
    end
         factor4 = 1;
    for i = j+1:n
         factor4 = factor4*(a(j)-a(i)); 
    end
    L(j) = (factor1*factor2)/(factor3*factor4);    
end
P = 0;
for j = 1:n
    P = P+(L(j)*b(j)); 
end
ans = P
F = inline(P);
xx = 12:0.001:17;
yy = F(xx);
hold on
grid on
plot(xx,yy)

