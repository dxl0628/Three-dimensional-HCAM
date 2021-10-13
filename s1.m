function [Ut,Vi,UU]=s1(B,node,Ui)
%求每个单元的面积%输入B和node
%调用的是node，所以是算平面的

for i=1:size(B(:,1))
xx1=node(B(i,2),2);
yy1=node(B(i,2),3);
zz1=node(B(i,2),4);
xx2=node(B(i,3),2);
yy2=node(B(i,3),3);
zz2=node(B(i,3),4);
xx3=node(B(i,4),2);
yy3=node(B(i,4),3);
zz3=node(B(i,4),4);
xx4=node(B(i,5),2);
yy4=node(B(i,5),3);
zz4=node(B(i,5),4);
a=[1 1 1 1;xx1 xx2 xx3 xx4;yy1 yy2 yy3 yy4;zz1 zz2 zz3 zz4];
Vi(i,1)=1/6000000000*det(a);          
end
UU=Ui.*Vi;%每个单元的应变能
Ut=sum(UU);
end