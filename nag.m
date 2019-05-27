niter = 300;
x = y;
E = double.empty(300, 0);
b =0.9;
vel = 0;
proj_x = [];
for i=1:niter
    E(i) = f(y,x,epsilon);
    proj_x = x - tau*vel;
    vel = b*vel+ (1-b)*Gradf(y, proj_x, epsilon);
    x = x - tau*vel;
end