niter = 300;
x = y;
E = double.empty(300, 0);
for i=1:niter
    E(i) = f(y,x,epsilon);
    x = x - tau*Gradf(y,x,epsilon);
end