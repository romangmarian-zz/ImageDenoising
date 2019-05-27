addpath('toolbox_signal')
addpath('toolbox_general')
addpath('toolbox_graph')
addpath('solutions/optim_1_gradient_descent')
n = 256;
x0 = rescale( load_image('test',n) );

clf;
imageplot(x0);

grad = @(x)cat(3, x-x([end 1:end-1],:), x-x(:,[end 1:end-1]));
v = grad(x0);

div = @(v)v([2:end 1],:,1)-v(:,:,1) + v(:,[2:end 1],2)-v(:,:,2);

sigma = .1;
y = x0 + randn(n)*sigma;    
clf;
imageplot(clamp(y));

lambda = .3/5;
epsilon = 1e-3;

NormEps = @(u,epsilon)sqrt(epsilon^2 + sum(u.^2,3));
J = @(x,epsilon)sum(sum(NormEps(grad(x),epsilon)));

f = @(y,x,epsilon)1/2*norm(x-y,'fro')^2 + lambda*J(x,epsilon);
Normalize = @(u,epsilon)u./repmat(NormEps(u,epsilon), [1 1 2]);
GradJ = @(x,epsilon)-div( Normalize(grad(x),epsilon) );
Gradf = @(y,x,epsilon)x-y+lambda*GradJ(x,epsilon);

tau = 1.8/( 1 + lambda*8/epsilon );
tau = tau*4;

nag()

clf;
imageplot(clamp(x));