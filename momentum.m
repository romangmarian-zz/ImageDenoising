niter = 20;
x = y;
E = double.empty(300, 0);
b =0.9;
vel = 0;
for i=1:niter
    E(i) = f(y,x,epsilon);
    vel = b*vel+ (1-b)*Gradf(y, x, epsilon);
    x = x - tau*vel;
end