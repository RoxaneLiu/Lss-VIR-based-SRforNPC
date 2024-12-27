function [ CoorPoint_Osag ] = T_Ext_ROI_Coordinate_Osag( Img )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
RoiNum=0;
CoorPoint_Osag=[0,0];

%¶þÖµ»¯
for x=1:512
    for y=1:512
        if Img(x,y)>=220 
            CoorImg(x,y)=0;
        else
            CoorImg(x,y)=1;            
        end        
    end
end

for x=1:512
    for y=1:512
        if CoorImg(x,y)==1% && 
            RoiNum=RoiNum+1;
            CoorPoint_Osag(RoiNum,1)=x;
            CoorPoint_Osag(RoiNum,2)=y;
            CoorImg=ImClear(CoorImg,x,y,15);
        end
    end
end

end

function [ImOut]=ImClear(ImIn,Tx,Ty,N)
% [Hx,Wy]=size(ImIn);

for i=Tx:Tx+N
    for j=Ty:Ty+N
        ImIn(i,j)=0;
    end
end
ImOut=ImIn;

end