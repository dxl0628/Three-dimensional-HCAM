%--------��ȡtxt
n1 =5;%�ӵ�6�п�ʼд��
fid1 =fopen ('ELIST.txt','rt');fid2 = fopen('ELIST1.txt','wb');%������txt
n=0;t=0;lb=0;
while~feof(fid1)%д�����һ������Ϊֹ��
   x = fgetl(fid1);
   if (t~=0&&mod(t,21)==0)%��������
       x = fgetl(fid1);
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

n1 =0;%�ӵ�1�п�ʼд��
fid1 =fopen ('ELIST1.txt','rt');fid2 = fopen('ELIST2.txt','wb');%������txt
n=0;t=0;
while n<95660%д�����һ������Ϊֹ��
   x = fgetl(fid1);
   if (t==1)%��������
       x = fgetl(fid1);
       x = fgetl(fid1);
      
    end
    n=n+1;%ÿ�ε���fgetl���˹���fid1��ͷ���ỻ����һ�С�
    %n�Ǳ�־����ڼ��С�
    if(n>n1)
        fwrite(fid2,x,'char*1');%ʹ�� precision ���Ե�����ʾ���ı���ʽ
        fprintf(fid2,'\r\n');% windows �����µĻ��з�
        t=1;
    
    end
    
      
end
fclose(fid1);fclose(fid2);


%---------

a=load('ELIST2.txt');
b(:,1)=a(:,1);
b(:,2:4)=a(:,7:9);
b(:,5)=a(:,11);

%b(:,1)=a(:,1);  ������
%b(:,2:9)=a(:,7:14);
       
   


