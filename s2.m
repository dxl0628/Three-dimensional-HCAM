%����B
n1 =5;%�ӵ����п�ʼд��
fid1 =fopen('NLIST.txt','rt');fid2 = fopen('NLIST1.txt','wb');%������txt
n=0;t=0;

while~feof(fid1)%д�����һ������Ϊֹ��
    x = fgetl(fid1);
   if (t~=0&&mod(t,20)==0)%��������
       x = fgetl(fid1);
       x = fgetl(fid1);
      
    end
    n=n+1;%ÿ�ε���fgetl���˹���fid1��ͷ���ỻ����һ�С�
    %n�Ǳ�־����ڼ��С�
    if(n>n1)
        fwrite(fid2,x,'char*1');%ʹ�� precision ���Ե�����ʾ���ı���ʽ
        fprintf(fid2,'\r\n');% windows �����µĻ��з�
        t=t+1;
    
    end    
end
fclose(fid1);fclose(fid2);

node1=load('NLIST1.txt');%�ڵ�����
node=node1(:,1:4);


