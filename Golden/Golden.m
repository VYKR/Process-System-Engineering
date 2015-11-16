function [C]=Golden(a,b)
C=cell(1,7);
C{1,1}='K';C{1,2}='a';C{1,3}='u1';C{1,4}='f(u1)';
C{1,5}='u2';C{1,6}='f(u2)';C{1,7}='b';C{1,8}='L';
k=1;
L=b-a;
u1=a+0.382*L;
u2=a+0.618*L;
j1=f(u1);
j2=f(u2);
while 1
    C{k+1,1}=k;C{k+1,2}=a;C{k+1,7}=b;C{k+1,8}=L;
    C{k+1,3}=u1;
    C{k+1,5}=u2;
    C{k+1,4}=j1;
    C{k+1,6}=j2;
    if L<0.02
        break;
    end
    if j1>j2
        a=u1;b=b;u1=u2;j1=j2;
        u2=b-0.382*(b-a);
        j2=f(u2);
        L=b-a;
    else
        a=a;b=u2;u2=u1;j2=j1;
        u1=a+0.382*(b-a);
        j1=f(u1);
        L=b-a;
    end
    k=k+1;
end
return
end