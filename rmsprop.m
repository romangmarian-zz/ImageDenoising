niter = 10;
x = y;
E = [];
S = 0;
beta = 0.9;
fuzz = 1e-6;
for i = 1:niter
    E(end + 1) = f(y, x, epsilon);
    crtGrad = Gradf(y, x, epsilon);
    S = beta * S + (1 - beta) * (crtGrad .^ 2);
    x = x - tau * crtGrad ./ sqrt(S + fuzz);
end
clf;
