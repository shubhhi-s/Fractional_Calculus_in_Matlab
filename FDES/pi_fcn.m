function pis=pi_fcn(high_order)
% Eq 6
syms k x
for i=0:high_order
prt1=(-1)^(i+k);
prt2=factorial(i+k)/factorial(i-k);
prt3=(x^k)/((factorial(k))^2);
pii=prt1*prt2*prt3;
pis(i+1,1)=symsum(pii,k,0,i);
end
