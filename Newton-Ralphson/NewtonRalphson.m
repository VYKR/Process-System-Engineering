function NewtonRalphson(x,y)
xc=x+1;
yc=y+1;
while sqrt((xc-x)^2+(yc-y)^2)>0.001
    xc=x;
    yc=y;
    X=[x;y];
    f1=x^2+y^2-4;
    f2=exp(-x)+y-1;
    f=[f1;f2];
    J=[2*x,2*y;-exp(-x),1];
    X=X-J^(-1)*f;
    x=X(1,1);
    y=X(2,1);
    fprintf('x=%.4f, y=%.4f\n',x,y);
end
    
    

