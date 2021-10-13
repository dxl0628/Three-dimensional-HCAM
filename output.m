function [ res ] = output(Xi,B)
%UNTITLED 输出函数
%   此处显示详细说明
%fid=fopen('v.txt','wt');
%fprintf(fid,'%d\n%d\n%d',L,W,b);%————————可能不需要
%fclose(fid);

CS_1=sum(Xi(:)==0);%有多少个单元为0，cs_1就为多少，第一次0
if CS_1==0
    CS_1=0.5;
end
CS_2=sum(Xi(:)==0.25);
if CS_2==0    %如果cs_2==0,意味着没有一个
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
    fclose(fid);   %把CS_1,CS_2,CS_3,CS_4,CS_5写入
    if CS_1~=0.5
        fidd=fopen('JDbh_1.txt','wt');
        for i=1:size(B(:,1)) 
               if Xi(i,1)==0
                 danyuan=i; %逻辑运算出哪些是用材料2的单元编号
                 fprintf(fidd,'%d\n',danyuan);                    
                end
        end
        fclose(fidd);        
    end
    if CS_2~=0.5
        fidd=fopen('JDbh_2.txt','wt');
         for i=1:size(B(:,1)) 
               if Xi(i,1)==0.25
                 danyuan=i;  %逻辑运算出哪些是用材料2的单元编号
                 fprintf(fidd,'%d\n',danyuan);                    
               end
        end
        fclose(fidd);        
    end
    if CS_3~=0.5
        fidd=fopen('JDbh_3.txt','wt');
        for i=1:size(B(:,1)) 
        
                if Xi(i,1)==0.5
                 danyuan=i;   %逻辑运算出哪些是用材料2的单元编号
                 fprintf(fidd,'%d\n',danyuan);                    
                end
                
            
        end
        fclose(fidd);        
    end
     if CS_4~=0.5
        fidd=fopen('JDbh_4.txt','wt');
        for i=1:size(B(:,1)) 
            
                if Xi(i,1)==0.75
                 danyuan=i;   %逻辑运算出哪些是用材料2的单元编号
                 fprintf(fidd,'%d\n',danyuan);                    
                end
                
           
        end
        fclose(fidd);        
     end
     
 
    save('mta.txt','-ascii','Xi')
res=1;
end