function G=G_fcn(yx,high_order)
% Page 3
% Cj = (2j+1) integration(yx*px) from 0 to 1

syms x k
if isa(yx,'function_handle')
    yxx=yx(x);
else
    yxx=yx;
end
% high_order=2;

for i=0:high_order
    prt1=(-1)^(i+k);
    prt2=factorial(i+k)/factorial(i-k);
    prt3=(x^k)/((factorial(k))^2);
    pii=prt1*prt2*prt3;
    pis=symsum(pii,k,0,i);
    yp=collect(yxx*pis);
    Gi=(2*i+1)*int(yp,x,0,1);
    G(i+1,1)=double(Gi);
end