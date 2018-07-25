function y = xiaobo(jz,dnum,num,znum)
y=zeros(znum,dnum);
plot(jz(1:num,:));
for i=1:1:dnum
    if num>znum 
        num=znum;
    end
    x=1:znum/num:znum;
    x1=1:1:znum;
    [s1,~]=mapminmax(interp1(x,jz(1:num,i),x1,'spline','extrap'), 0, 1);%Use extrap method to avoid NaN
    y(1:znum,i)=s1;
end
hold on;
plot(y(1:znum,:));


