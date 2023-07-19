function D=D1(m)
% equation 9
D=zeros(m);
c=2;
n=1;

for i=1:m
    x=D(:,i);
    x(c:2:end)=n;
    D(:,i)=x;
    n=n+2;
    c=c+1;
end
D=2*D;