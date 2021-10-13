e=200000000000;       %弹性模量
Xi=ones(size(B(:,1)));%一开始的初始相对密度。

Qu=zeros(size(B(:,1)));  %去掉的单元
fid=fopen('Q.txt','wt');
fprintf(fid,'%d\n',Qu);

j=0;     %代数
I=e*Xi;%I弹性模量  
fid=fopen('J.txt','wt'); %弹性模量
fprintf(fid,'%d\n',I);

qq=0;     %去掉单元的数目
fid=fopen('qq.txt','wt');
fprintf(fid,'%d\n',qq);

Ui=zeros(size(B(:,1)));%每个单元的应变能密度
Uimax=0;%单元最大应变能
Uimax_f=0;%单元一开始最大应变能
aif=9750000;%input('请输入一个权系数：');%权系数//这里是测试值
Cp=0.5;%input('请输入一个线性权系数：');%权系数 线性控制规则//这里是测试值
V0=693.059 *1000000000000000000;%初始的体积    影响性能指标
n=0;%代数初始为0代
M1=0;M2=0;M3=0;%当前次的总质量
Smd=input('请输入一个实际的密度：');%实际的单元密度（不一定是2）%16随便输
M0=V0/1000000000000000000000000000*Smd;%初始的质量
E=0;
  while ((E>1e-3)||(n<=3)||(E<=-1e-3))%这里0.001就是一个收敛的标准E是一个两代的质量差值平均值除以初始质量
    M3=M2; 
    M2=M1;
    %cd('E:\test_1');
    %mesh(Xi);%----------？？
    %system('"D:\Vansys\ANSYS Inc\v150\ansys\bin\winx64\ansys150.exe" -b -p ane3flds -i E:\test_1\mac.mac -o E:\test_1\output.txt');
     Ui=SHCH(B);
    if (n==0)%用来计算初始的最大应变能                
         Uimax_f=max(max(Ui));            
    end
    Uimax=max(Ui);
    [Ut,Vi,UU]=s1(B,node,Ui);%每一代的总的应变能
    Ux=aif*Ut/V0;%每一代都是不同的Ux。
    BUi=PJ(UU,lbjz,Vi);%BUi每个单元的平均应变能密度
    ei=BUi/Ux-1;   %ei误差信号      BUi 元胞单元i的SED（局部刚性指标）平均值
    xii=Cp*ei;   %xii单元相对密度变化值
    Xi=Xi+xii;   %Xi单元相对密度
    Xi(Xi>1)=1;%大于1为1
    Xi(Xi==0)=0.00000000000001;%小于0为0
    Xi(Xi<0)=0.00000000000001;%小于0为0
    I=e*Xi;%I弹性模量
    fid=fopen('J.txt','wt');
    fprintf(fid,'%d\n',I);
    j=0;
    for i=1:size(B(:,1))
        if Xi(i,1)==0.00000000000001
            j=j+1;
            Qu(j,1)=i;
        end
    end%找出Xi中去掉单元的编号保存txt
     fid=fopen('Q.txt','wt');
    fprintf(fid,'%d\n',Qu);
     fid=fopen('qq.txt','wt');
    fprintf(fid,'%d\n',j);
    M1=sum(Xi.*Vi*Smd);%把缓存的质量赋予当前代质量变量
    F(n+1,1)=M1/M0;%质量比
    Pit=(Uimax_f*M0)/(Uimax*M1);%计算每一代的性能指标
    XN(n+1,1)=Pit;%存储每一代的性能指标
    fprintf('第%d代的性能指标是%d\n',n,Pit);
    E=SL(n,M1,M2,M3,M0);
    fid=fopen('data.txt','a');
    fprintf(fid,'%d %d %d %d\n',n,M1,Pit,E);
    fclose(fid);
    n=n+1;%用来标记代数
    pause(.05);%暂停0.05秒，观察变化过程   
   end
 while ((E<1e-3)||(E>-1e-3))
    fprintf('总共迭代了%d代\n',n);
    fprintf('运算以结束，答案以收敛。');
    P=1;
    break;
 end