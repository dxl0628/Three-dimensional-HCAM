function [ res ] = output(Xi,B)
%UNTITLED �������
%   �˴���ʾ��ϸ˵��
%fid=fopen('v.txt','wt');
%fprintf(fid,'%d\n%d\n%d',L,W,b);%�������������������ܲ���Ҫ
%fclose(fid);

CS_1=sum(Xi(:)==0);%�ж��ٸ���ԪΪ0��cs_1��Ϊ���٣���һ��0
if CS_1==0
    CS_1=0.5;
end
CS_2=sum(Xi(:)==0.25);
if CS_2==0    %���cs_2==0,��ζ��û��һ��
    CS_2=0.5;
end
CS_3=sum(Xi(:)==0.5);
if CS_3==0
    CS_3=0.5;
end
CS_4=sum(Xi(:)==0.75);
if CS_4==0
    CS_4=0.5;
end
CS_5=sum(Xi(:)==1); 
    fid=fopen('jiancha.txt','wt');
    fprintf(fid,'%d\n%d\n%d\n%d\n%d',CS_1,CS_2,CS_3,CS_4,CS_5);
    fclose(fid);   %��CS_1,CS_2,CS_3,CS_4,CS_5д��
    if CS_1~=0.5
        fidd=fopen('JDbh_1.txt','wt');
        for i=1:size(B(:,1)) 
               if Xi(i,1)==0
                 danyuan=i; %�߼��������Щ���ò���2�ĵ�Ԫ���
                 fprintf(fidd,'%d\n',danyuan);                    
                end
        end
        fclose(fidd);        
    end
    if CS_2~=0.5
        fidd=fopen('JDbh_2.txt','wt');
         for i=1:size(B(:,1)) 
               if Xi(i,1)==0.25
                 danyuan=i;  %�߼��������Щ���ò���2�ĵ�Ԫ���
                 fprintf(fidd,'%d\n',danyuan);                    
               end
        end
        fclose(fidd);        
    end
    if CS_3~=0.5
        fidd=fopen('JDbh_3.txt','wt');
        for i=1:size(B(:,1)) 
        
                if Xi(i,1)==0.5
                 danyuan=i;   %�߼��������Щ���ò���2�ĵ�Ԫ���
                 fprintf(fidd,'%d\n',danyuan);                    
                end
                
            
        end
        fclose(fidd);        
    end
     if CS_4~=0.5
        fidd=fopen('JDbh_4.txt','wt');
        for i=1:size(B(:,1)) 
            
                if Xi(i,1)==0.75
                 danyuan=i;   %�߼��������Щ���ò���2�ĵ�Ԫ���
                 fprintf(fidd,'%d\n',danyuan);                    
                end
                
           
        end
        fclose(fidd);        
     end
     
 
    save('mta.txt','-ascii','Xi')
res=1;
end