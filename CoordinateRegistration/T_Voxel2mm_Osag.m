function [ Coormm ] = T_Voxel2mm_Osag(Coor,info)
%����������任������ռ����꣬��λΪmm
% Coor��һ����ά���꣬info��DICOM��ͷ��Ϣ

Num=size(Coor,1);
for i=1:Num
    Coormm(i,1)=double(Coor(i,1))*double(info.PixelSpacing(1));
    Coormm(i,2)=double(Coor(i,2))*double(info.PixelSpacing(2));
end


end

