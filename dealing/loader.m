function y = loader(p,fileName,sen,name)
fid=fopen(fileName,'r');
cd('..');
out=fopen(name,'a');
out2=fopen('y_train.txt','a');
out3=fopen('cnn_y_train.txt','a');
out4=fopen('cgbabai.txt','a');
s=zeros(p.znum,p.dnum);
num=1;
while ~feof(fid)
    mline = fgetl(fid);
    if length(mline) < 2
        z=xiaobo(s(1:p.znum,1:p.dnum),p.dnum,num-1,p.znum);
        for j=1:1:p.znum
             fprintf(out,'%g ',z(j,:));
             fprintf(out,'\n');
        end
        if strcmp(name,'emgtrainright.txt' )
            fprintf(out2,'%g ',sen);
            fprintf(out2,'\n');
            fprintf(out3,'%d\n',p.snum);
            if num>p.znum
                fprintf(out4,'1\n');
            end
        end
        fprintf(out,'\n');
        s=zeros(p.znum,p.dnum);
        num=1;
    else
        sp = regexp(mline, ' ', 'split');
        for j=1:1:p.dnum
            s(num,j)=str2double(char(sp(j+1)));
        end
        num=num+1;
    end
end

fclose(fid);
fclose(out);
fclose(out2);
fclose(out3);
fclose(out4);

