function D2=Dalpha(m,alpha)
% equation 14
a1=ceil(alpha);

D2=zeros(m+1);

for i=a1:m
    for j=0:m
        t=theta(i,j,alpha);
        D2(i+1,j+1)=sum(t(:));
    end
end