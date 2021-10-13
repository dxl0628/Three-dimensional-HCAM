function [ BUi ] = PJ( UU,lbjz,Vi )
%UNTITLED4 此处显示有关此函数的摘要
%   BUi每个单元的平均应变能密度
    BUi=ones(size(lbjz(:,1)));
    
    for Xuib=1:size(lbjz(:,1))
        BB=ismember(0,lbjz(Xuib,:));
        blwz=find(lbjz(Xuib,:)~=0);%不是零的位置
        blcd=length(blwz);%零的长度
        if BB
            if  blcd==3
            BUi(Xuib,1)=(UU(Xuib,1)+UU(lbjz(Xuib,blwz(1,1)),1)+UU(lbjz(Xuib,blwz(1,2)),1)+UU(lbjz(Xuib,blwz(1,3)),1))/(Vi(Xuib,1)+Vi(lbjz(Xuib,blwz(1,1)),1)+Vi(lbjz(Xuib,blwz(1,2)),1)+Vi(lbjz(Xuib,blwz(1,3)),1));
            end
            if  blcd==2
            BUi(Xuib,1)=(UU(Xuib,1)+UU(lbjz(Xuib,blwz(1,1)),1)+UU(lbjz(Xuib,blwz(1,2)),1))/(Vi(Xuib,1)+Vi(lbjz(Xuib,blwz(1,1)),1)+Vi(lbjz(Xuib,blwz(1,2)),1));
            end
        end
        if ~BB
             BUi(Xuib,1)=(UU(Xuib,1)+UU(lbjz(Xuib,1),1)+UU(lbjz(Xuib,2),1)+UU(lbjz(Xuib,3),1)+UU(lbjz(Xuib,4),1))/(Vi(Xuib,1)+Vi(lbjz(Xuib,1),1)+Vi(lbjz(Xuib,2),1)+Vi(lbjz(Xuib,3),1)+Vi(lbjz(Xuib,4),1));
        end
    end
end

