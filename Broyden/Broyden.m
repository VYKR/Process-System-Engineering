function Broyden(x,y)
f1=F1(x,y);
f2=F2(x,y);
absf0 =sqrt(f1^2+f2^2);
i=0.001;
J=[2*x,2*y;-exp(-x),1];
H=-J^(-1);
ex=1;ey=1;
while sqrt(ex^2+ey^2)>0.001
m=[x;y];
f1=F1(x,y);
f2=F2(x,y);
f=[f1;f2];
d=H*f;
s=m+d;
f1=F1(s(1,1),s(2,1));f2=F2(s(1,1),s(2,1));
absf1=sqrt(f1^2+f2^2);
while absf1>absf0
      yita=(absf1/absf0)^2;
      t=(sqrt(1+6*yita)-1)/(3*yita);
      m=m+t*H*f;
      f1=F1(m(1,1),m(2,1));
      f2=F2(m(1,1),m(2,1));
      absf1=sqrt(f1^2+f2^2);
end
absf0=absf1;
f=[f1;f2];
if m==(s-d)
    m=s;
end
d=m-[x;y];
df=f-[F1(x,y);F2(x,y)];
dh=((d+H*df)*(d'*H))/(d'*H*df);
H=H+dh;
ex=d(1,1);ey=d(2,1);
x=m(1,1);y=m(2,1);
fprintf('x=%.4f,y=%.4f\n',x,y);
end
end