function [ Xi] = GB(BUi,B,Ux,Ux_1,Ux_2,Ux_3)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
    Xi=ones(size(B(:,1)));
    for Xuib=1:size(B(:,1))
        
           if (BUi(Xuib,1)>=Ux)
               Xi(Xuib,1)=1;
           end
           if ((BUi(Xuib,1)<Ux)&&(BUi(Xuib,1)>=Ux_3))
               Xi(Xuib,1)=0.75;
           end
           if ((BUi(Xuib,1)<Ux_3)&&(BUi(Xuib,1)>=Ux_2))
               Xi(Xuib,1)=0.5;
           end
           if ((BUi(Xuib,1)<Ux_2)&&(BUi(Xuib,1)>=Ux_1))
               Xi(Xuib,1)=0.25;
           end
           if (BUi(Xuib,1)<Ux_1)
               Xi(Xuib,1)=0;
           end
	    
       
    end

end
