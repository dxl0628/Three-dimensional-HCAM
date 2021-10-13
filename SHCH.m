function [ Ui ] = SHCH( ~ )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
Sx=load('YLx.txt');%主应力
 Sy=load('YLy.txt');%主应力
 Sz=load('YBz.txt');%主应力
 Sxy=load('YLxy.txt');%切应力
 Sxz=load('YBxz.txt');%切应力
 Syz=load('YByz.txt');%切应力
 Gx=load('YBx.txt');
 Gy=load('YBy.txt');
 Gz=load('YBz.txt');
 Gxy=load('YBxy.txt');
 Gxz=load('YBxz.txt');
 Gyz=load('YByz.txt');
 %Sx=reshape(Sx,L,W);%B = reshape(A,m,n) 返回一个m*n的矩阵B， B中元素是按列从A中得到的。如果A中元素个数没有m*n个， 则会引发错误。
 %Sx=Sx';
 %Sy=reshape(Sy,L,W);
 %Sy=Sy';
 %Sz=reshape(Sz,L,W);
 %Sz=Sz';
 %Sxy=reshape(Sxy,L,W);
 %Sxy=Sxy';
 %Sxz=reshape(Sxz,L,W);
 %Sxz=Sxz';
 %Syz=reshape(Syz,L,W);
 %Syz=Syz';
 %Gx=reshape(Gx,L,W);
 %Gx=Gx';
 %Gy=reshape(Gy,L,W);
 %Gy=Gy';
 %Gz=reshape(Gz,L,W);
 %Gz=Gz';
 %Gxy=reshape(Gxy,L,W);
 %Gxy=Gxy';
 %Gxz=reshape(Gxz,L,W);
 %Gxz=Gxz';
 %Gyz=reshape(Gyz,L,W);
 %Gyz=Gyz';
    Ui=(Sx.*Gx)+(Sy.*Gy)+(Sz.*Gz)+(Sxy.*Gxy)+(Sxz.*Gxz)+(Syz.*Gyz);
    Ui=Ui(1:95660,1);

end