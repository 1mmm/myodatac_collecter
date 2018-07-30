function y = xiaobo(jz,dnum,num,znum)
y=zeros(znum,dnum);
for i=1:1:dnum
    if num>znum 
        num=znum;
    end
    x=1:znum/num:znum;
    x1=1:1:znum;
    s1=interp1(x,jz(1:num,i),x1,'spline','extrap');%Use extrap method to avoid NaN
    y(1:znum,i)=s1;
end




