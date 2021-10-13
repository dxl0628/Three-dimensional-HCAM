%输入B
n1 =5;%从第五行开始写入
fid1 =fopen('NLIST.txt','rt');fid2 = fopen('NLIST1.txt','wb');%打开两个txt
n=0;t=0;

while~feof(fid1)%写到最后一列数据为止。
    x = fgetl(fid1);
   if (t~=0&&mod(t,20)==0)%跳过两行
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

node1=load('NLIST1.txt');%节点坐标
node=node1(:,1:4);


