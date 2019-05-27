niter = 100;
x = y;
E = double.empty(300, 0);
s = 0;
vel = 0;
b1 = 0.9;
b2 = 0.999;
fuzz = 10^(-8);
for i=2:niter
    
    E(i) = f(y,x,epsilon);
    crGrad = Gradf(y, x, epsilon);
    
    vel = b1*vel + (1 - b1)*crGrad;
    s = b2*s + (1 - b2)*crGrad.^2;
    
    vel_hat = vel./(1 - b1^i);
    s_hat = s./(1 - b2^i);
    
    x = x - tau*vel_hat./(sqrt(s_hat) + fuzz);
end