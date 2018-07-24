function y = xiaobo(jz,dnum)
for i=1:1:dnum
    s1=mapminmax(wden(jz(:,i),'minimaxi','s','one',5,'db12')', 0, 1)';
    y(:,i)=s1;
end

