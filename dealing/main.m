
sen=[16 14 15 0;
     16 1 35 0;
     17 2 34 0;
     18 1 34 0;
     22 4 33 0;
     17 4 30 0;
     22 5 30 0;
     20 6 29 0;
     21 6 27 0;
     23 7 25 0;
     25 7 21 0;
     24 8 15 0;
     18 9 23 0;
     16 9 20 0;
     31 14 15 0;
     17 13 1 0;
     16 13 2 0;
     19 8 15 0;
     33 14 32 0;
     17 6 28 0;
     25 12 22 0;
     25 11 30 0;
     16 14 15 1;
     17 8 15 2;
     20 8 6 26;
     19 1 30 35;
     31 14 3 30;
     16 14 13 1;
     21 10 11 30;
     23 13 12 24];

filed = dir('.');

for fnum=3:length(filed)
if  filed(fnum).isdir
    
cd(filed(fnum).name);
file=dir('*.txt');    
for n=1:length(file)
    z=file(n).name;
    s = regexp(z, '-', 'split');
    hand=char(s(1));
    if strcmp(hand,'MyoLeft' )
        hands='left';
    else
        hands='right';
    end
    p.snum=str2num(char(s(2)));
    sentence=sen(p.snum,:);
    sensor=char(s(4));
    if strcmp(sensor,'accelerometer' )
        p.dnum=3;
        p.znum=402;
        name='acctrain';
    else if strcmp(sensor,'orientation' )
            p.dnum=4;
            p.znum=400;
            name='oritrain';
         else if strcmp(sensor,'gyro' )   
                p.dnum=3;
                p.znum=402;
                name='gyrtrain';
              else if strcmp(sensor,'emg' )
                     p.dnum=8; 
                     p.znum=402;
                     name='emgtrain';
                  else 
                      p.dnum=3;
                      p.znum=400;
                      name='oltrain';
                  end
             end
        end
    end
    loader(p,file(n).name,sentence,[name,hands,'.txt']);
    cd(filed(fnum).name);
end
cd('..');
end
end

