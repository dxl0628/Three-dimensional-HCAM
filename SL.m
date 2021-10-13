function [ E ] = SL( n,M1,M2,M3,M0 )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
    if n>=3%循环三代开始后计算是否收敛
        E=((M1-M2)+(M2-M3))/M0;%计算 E判断是否继续运算，是否收敛。
    else
        E=0;
    end 
end

