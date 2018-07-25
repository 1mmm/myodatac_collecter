function y = xiaobo(jz,dnum,num,znum)
for i=1:1:dnum
    if num>znum 
        num=znum;
    end
    x=1:znum/num:znum;
    x1=1:1:znum;
    s1=mapminmax(interp1(x,jz(1:num,i),x1,'nearest'), 0, 1);
    y(1:znum,i)=s1;
end


