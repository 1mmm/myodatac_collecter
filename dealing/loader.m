function y = loader(p,fileName,sen,q)
fid=fopen(fileName,'r');
cd('..');
aname=[q.name,'train',q.hands,'.txt'];
out=fopen(aname,'a');
tout=fopen([q.name,'test',q.hands,'.txt'],'a');
tnum=3;
ctout=fopen([q.name,'ctest',q.hands,'.txt'],'a');
ctnum=3;
out2=fopen('y_train.txt','a');
out3=fopen('cnn_y_train.txt','a');
out4=fopen('cgbabai.txt','a');
out5=fopen('y_test.txt','a');
out6=fopen('y_ctest.txt','a');
s=zeros(p.znum,p.dnum);
num=1;
while ~feof(fid)
    mline = fgetl(fid);
    if length(mline) < 2

        z=xiaobo(s(1:p.znum,1:p.dnum),p.dnum,num-1,p.znum);
        %if strcmp(name,'acctrainright.txt') 
         %   if p.snum==1
          %      figure(unidrnd(7))
           %     subplot(1,2,1)
            %    plot(s(1:p.znum,1:p.dnum));
             %   subplot(1,2,2)
              %  plot(z);
           % end
        %end
        if tnum>0
            tnum=tnum-1;
            for j=1:1:p.znum
                 fprintf(tout,'%g ',z(j,:));
                 fprintf(tout,'\n');
            end
            if strcmp(aname,'emgtrainright.txt' )
                fprintf(out5,'%g ',sen);
                fprintf(out5,'\n');
            end
            fprintf(tout,'\n');
        else
            if ctnum>0
                ctnum=ctnum-1;
                for j=1:1:p.znum
                    fprintf(ctout,'%g ',z(j,:));
                    fprintf(ctout,'\n');
                end
                if strcmp(aname,'emgtrainright.txt' )
                    fprintf(out6,'%g ',sen);
                    fprintf(out6,'\n');
                end
                fprintf(ctout,'\n');
            else
                for j=1:1:p.znum
                    fprintf(out,'%g ',z(j,:));
                    fprintf(out,'\n');
                end
                if strcmp(aname,'emgtrainright.txt' )
                    fprintf(out2,'%g ',sen);
                    fprintf(out2,'\n');
                    fprintf(out3,'%d\n',p.snum);
                end
                fprintf(out,'\n');
            end
        end
                

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
fclose(tout);
fclose(ctout);
fclose(out2);
fclose(out3);
fclose(out4);
fclose(out5);
fclose(out6);

