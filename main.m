e=200000000000;       %����ģ��
Xi=ones(size(B(:,1)));%һ��ʼ�ĳ�ʼ����ܶȡ�

Qu=zeros(size(B(:,1)));  %ȥ���ĵ�Ԫ
fid=fopen('Q.txt','wt');
fprintf(fid,'%d\n',Qu);

j=0;     %����
I=e*Xi;%I����ģ��  
fid=fopen('J.txt','wt'); %����ģ��
fprintf(fid,'%d\n',I);

qq=0;     %ȥ����Ԫ����Ŀ
fid=fopen('qq.txt','wt');
fprintf(fid,'%d\n',qq);

Ui=zeros(size(B(:,1)));%ÿ����Ԫ��Ӧ�����ܶ�
Uimax=0;%��Ԫ���Ӧ����
Uimax_f=0;%��Ԫһ��ʼ���Ӧ����
aif=9750000;%input('������һ��Ȩϵ����');%Ȩϵ��//�����ǲ���ֵ
Cp=0.5;%input('������һ������Ȩϵ����');%Ȩϵ�� ���Կ��ƹ���//�����ǲ���ֵ
V0=693.059 *1000000000000000000;%��ʼ�����    Ӱ������ָ��
n=0;%������ʼΪ0��
M1=0;M2=0;M3=0;%��ǰ�ε�������
Smd=input('������һ��ʵ�ʵ��ܶȣ�');%ʵ�ʵĵ�Ԫ�ܶȣ���һ����2��%16�����
M0=V0/1000000000000000000000000000*Smd;%��ʼ������
E=0;
  while ((E>1e-3)||(n<=3)||(E<=-1e-3))%����0.001����һ�������ı�׼E��һ��������������ֵƽ��ֵ���Գ�ʼ����
    M3=M2; 
    M2=M1;
    %cd('E:\test_1');
    %mesh(Xi);%----------����
    %system('"D:\Vansys\ANSYS Inc\v150\ansys\bin\winx64\ansys150.exe" -b -p ane3flds -i E:\test_1\mac.mac -o E:\test_1\output.txt');
     Ui=SHCH(B);
    if (n==0)%���������ʼ�����Ӧ����                
         Uimax_f=max(max(Ui));            
    end
    Uimax=max(Ui);
    [Ut,Vi,UU]=s1(B,node,Ui);%ÿһ�����ܵ�Ӧ����
    Ux=aif*Ut/V0;%ÿһ�����ǲ�ͬ��Ux��
    BUi=PJ(UU,lbjz,Vi);%BUiÿ����Ԫ��ƽ��Ӧ�����ܶ�
    ei=BUi/Ux-1;   %ei����ź�      BUi Ԫ����Ԫi��SED���ֲ�����ָ�꣩ƽ��ֵ
    xii=Cp*ei;   %xii��Ԫ����ܶȱ仯ֵ
    Xi=Xi+xii;   %Xi��Ԫ����ܶ�
    Xi(Xi>1)=1;%����1Ϊ1
    Xi(Xi==0)=0.00000000000001;%С��0Ϊ0
    Xi(Xi<0)=0.00000000000001;%С��0Ϊ0
    I=e*Xi;%I����ģ��
    fid=fopen('J.txt','wt');
    fprintf(fid,'%d\n',I);
    j=0;
    for i=1:size(B(:,1))
        if Xi(i,1)==0.00000000000001
            j=j+1;
            Qu(j,1)=i;
        end
    end%�ҳ�Xi��ȥ����Ԫ�ı�ű���txt
     fid=fopen('Q.txt','wt');
    fprintf(fid,'%d\n',Qu);
     fid=fopen('qq.txt','wt');
    fprintf(fid,'%d\n',j);
    M1=sum(Xi.*Vi*Smd);%�ѻ�����������赱ǰ����������
    F(n+1,1)=M1/M0;%������
    Pit=(Uimax_f*M0)/(Uimax*M1);%����ÿһ��������ָ��
    XN(n+1,1)=Pit;%�洢ÿһ��������ָ��
    fprintf('��%d��������ָ����%d\n',n,Pit);
    E=SL(n,M1,M2,M3,M0);
    fid=fopen('data.txt','a');
    fprintf(fid,'%d %d %d %d\n',n,M1,Pit,E);
    fclose(fid);
    n=n+1;%������Ǵ���
    pause(.05);%��ͣ0.05�룬�۲�仯����   
   end
 while ((E<1e-3)||(E>-1e-3))
    fprintf('�ܹ�������%d��\n',n);
    fprintf('�����Խ���������������');
    P=1;
    break;
 end