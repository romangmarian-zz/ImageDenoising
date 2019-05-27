niter = 100;
x = y;
E = double.empty(300, 0);
s = 0;
fuzz = 10^-7;
for i=1:niter
    E(i) = f(y,x,epsilon);
    crGrad = Gradf(y, x, epsilon);
    s = s + crGrad.^2;
    x = x - tau*Gradf(y, x, epsilon)./(sqrt(fuzz + s));
end