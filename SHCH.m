function [ Ui ] = SHCH( ~ )
%UNTITLED6 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
Sx=load('YLx.txt');%��Ӧ��
 Sy=load('YLy.txt');%��Ӧ��
 Sz=load('YBz.txt');%��Ӧ��
 Sxy=load('YLxy.txt');%��Ӧ��
 Sxz=load('YBxz.txt');%��Ӧ��
 Syz=load('YByz.txt');%��Ӧ��
 Gx=load('YBx.txt');
 Gy=load('YBy.txt');
 Gz=load('YBz.txt');
 Gxy=load('YBxy.txt');
 Gxz=load('YBxz.txt');
 Gyz=load('YByz.txt');
 %Sx=reshape(Sx,L,W);%B = reshape(A,m,n) ����һ��m*n�ľ���B�� B��Ԫ���ǰ��д�A�еõ��ġ����A��Ԫ�ظ���û��m*n���� �����������
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