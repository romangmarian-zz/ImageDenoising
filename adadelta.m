niter = 300;
xs = cat(3, zeros(256,256), zeros(256,256));
xs(:,:,2) = y;
Ds = cat(3, zeros(256,256), zeros(256, 256));
Ss = cat(3, zeros(256,256), zeros(256, 256));
beta = 0.95;
fuzz = 1e-6;
E = [];
for i=3:niter + 3
    E(end + 1) = f(y, xs(:,:,i-1), epsilon);
    crtGrad = Gradf(y, xs(:,:,i-1), epsilon);
    xs(:,:,i) = xs(:,:,i-1) - ((sqrt(Ds(:,:,i-2) + fuzz)) ./ (sqrt(Ss(:,:,i-1) + fuzz))) .* crtGrad;
    Ds(:,:,i) = beta * Ds(:,:,i-1) + (1 - beta) * ((xs(:,:,i) - xs(:,:,i-1)) .^ 2);
    Ss(:,:,i) = beta * Ss(:,:,i-1) + (1 - beta) * (crtGrad .^ 2);
end
x = xs(:,:,end);
clf;
h = plot(E);
set(h, 'LineWidth', 2);
axis tight;