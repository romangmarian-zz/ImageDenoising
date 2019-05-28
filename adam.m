niter = 300;
x = y;
S = 0;
V = 0;
beta1 = 0.9;
beta2 = 0.999;
fuzz = 1e-8;
E = [];
for i=1:niter
    E(end + 1) = f(y,x, epsilon);
    V = beta1 * V + (1 - beta1) * Gradf(y, x, epsilon);
    S = beta2 * S + (1 - beta2) * (Gradf(y, x, epsilon) .^ 2);
    Vmom = V ./ (1 - beta1 ^ i);
    Smom = S ./ (1 - beta2 ^ i);
    x = x - tau * Vmom ./ (sqrt(Smom) + fuzz);
end

clf;
h = plot(E);
set(h, 'LineWidth', 2);
axis tight;