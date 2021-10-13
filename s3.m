%--------读取txt
n1 =5;%从第6行开始写入
fid1 =fopen ('ELIST.txt','rt');fid2 = fopen('ELIST1.txt','wb');%打开两个txt
n=0;t=0;lb=0;
while~feof(fid1)%写到最后一列数据为止。
   x = fgetl(fid1);
   if (t~=0&&mod(t,21)==0)%跳过三行
       x = fgetl(fid1);
       x = fgetl(fid1);
       x = fgetl(fid1);
    end
    n=n+1;%每次调用fgetl完了过后，fid1的头都会换到下一行。
    %n是标志读入第几行。
    if(n>n1)
        fwrite(fid2,x,'char*1');%使用 precision 可以调整显示的文本形式
        fprintf(fid2,'\r\n');% windows 操作下的换行符
        t=t+1;
    
    end
    
      
end
fclose(fid1);fclose(fid2);

n1 =0;%从第1行开始写入
fid1 =fopen ('ELIST1.txt','rt');fid2 = fopen('ELIST2.txt','wb');%打开两个txt
n=0;t=0;
while n<95660%写到最后一列数据为止。
   x = fgetl(fid1);
   if (t==1)%跳过三行
       x = fgetl(fid1);
       x = fgetl(fid1);
      
    end
    n=n+1;%每次调用fgetl完了过后，fid1的头都会换到下一行。
    %n是标志读入第几行。
    if(n>n1)
        fwrite(fid2,x,'char*1');%使用 precision 可以调整显示的文本形式
        fprintf(fid2,'\r\n');% windows 操作下的换行符
        t=1;
    
    end
    
      
end
fclose(fid1);fclose(fid2);


%---------

a=load('ELIST2.txt');
b(:,1)=a(:,1);
b(:,2:4)=a(:,7:9);
b(:,5)=a(:,11);

%b(:,1)=a(:,1);  六面体
%b(:,2:9)=a(:,7:14);
       
   


