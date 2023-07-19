function Yx=fde_exact(polys,orders,yx,ydash_orders,ydash_values,x0)
% Only for 1 alpha differential 

L=length(orders);
m=max(orders);
D_1=D1(m+1);
z=find(ceil(orders)~=orders);
alpha=orders(z);
D2=Dalpha(m,alpha);
C=sym('c',[1 m+1]);

% D^n=D^1*D^1*... for n times
% equation 11
for n=2:m
    Dn=D_1;
    for j=2:n
        Dn=Dn*D_1;
    end
    D{n}=Dn;
end
D{1}=D_1;


G=G_fcn(yx,m);
P=pi_fcn(m);
RmPj=sym(-G'*P);
syms x

% First we convert the given equation
% into C*D^n*p+C*D^alpha*P+C*P-G*P=0
% in the RmPj , Then we integrate it
% equation 29
for i=1:L
    o=orders(i);
    if o>0
        if ceil(o)~=o
            RmPj=RmPj+C*D2*P;
        else
            RmPj=RmPj+C*D{o}*P;
        end
    else
        RmPj=RmPj+C*P;
    end
end
eq1=int(RmPj,x,0,1);

% equation 30
eqs=eq1;
p=subs(P,x,x0);
for j=1:length(ydash_orders)
    ydo=ydash_orders(j);
    ydv=ydash_values(j);
    if ydo==0
        eq=sum(C*p)-ydv;
    else
        eq=C*D{ydo}*p-ydv;
    end
    eqs=[eqs;eq];
end

% Dun :)
Cs=solve(eqs);
fn=fieldnames(Cs);
for n=1:m+1
    C_sol(1,n)=Cs.(fn{n});
end
Yx=C_sol*P;

%% Showing Results
fx=sym('0');
syms D y(x)
for j=1:L
    fx=fx+polys(j)*(D^orders(j))*y(x);
end
fx=fx==yx(x);
disp('For equation :')
disp('')
pretty(fx)
disp('The Condtions Are')
for j=1:length(ydash_orders)
    ydo=ydash_orders(j);
    if ydo>0
        zz=D^ydo*y(x0)==ydash_values(j);
    else
        zz=y(x0)==ydash_values(j);
    end
    pretty(zz)
end
disp('')
disp('Exact Solution :')
disp('')
pretty(Yx)
disp('Where D is the differential Opeational')

