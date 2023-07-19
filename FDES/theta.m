function t=theta(i,j,alpha)
% equation 15
% PS : I made it as matrix element wise
% To simplify it on my self
% if you are hero and want to re write
% it in for , please be my guest
% and kill your self later :)
% you will fail don't worry :)
al=ceil(alpha);
k=al:i;
l=0:j;
[K,L]=meshgrid(k,l);
x1=(-1).^(i+j+K+L);
x2=factorial(i+K);
x3=factorial(L+j);
up=x1.*x2.*x3;
xx1=factorial(i-K);
xx2=factorial(K);
xx3=gamma(K+1-alpha);
xx4=factorial(j-L);
xx5=(factorial(L)).^2;
xx6=K+L-alpha+1;
dw=xx1.*xx2.*xx3.*xx4.*xx5.*xx6;
t=(2*j+1).*up./dw;
