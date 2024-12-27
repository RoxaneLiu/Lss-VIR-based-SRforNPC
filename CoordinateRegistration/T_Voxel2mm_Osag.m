function [ Coormm ] = T_Voxel2mm_Osag(Coor,info)
%将体素坐标变换成立体空间坐标，单位为mm
% Coor是一个三维坐标，info是DICOM的头信息

Num=size(Coor,1);
for i=1:Num
    Coormm(i,1)=double(Coor(i,1))*double(info.PixelSpacing(1));
    Coormm(i,2)=double(Coor(i,2))*double(info.PixelSpacing(2));
end


end

