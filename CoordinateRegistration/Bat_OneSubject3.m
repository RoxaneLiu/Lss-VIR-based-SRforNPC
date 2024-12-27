clear
clc


DictName='10098822\';

%Dicom
 [Dcm,Info]=T_ReadDicom(DictName,'OAx_T2_FRFSE_3');
 [Dcm_DeBack,Bmp_DeBack ] = T_DeBackGroud( Dcm,Info );

%
[ Coor ] = T_ReadCoor_Png( DictName,'*.png');
%
[ CoorPoint ] = T_Ext_ROI_Coordinate( Coor );
CoorPoint=CoorPoint(1:4,:);
[ CoorPointmm ] = T_Voxel2mm(CoorPoint,Info(1));
%read ROI
[ Roi] = T_ReadRoi_Mat( DictName,'*.mat');

%read DICOM
Dcm_Osag1=dicomread('10098822\OSag_T1_FSE_6\5.dcm');
Dcm_Osag_Info=dicominfo('10098822\OSag_T1_FSE_6\5.dcm');
Dcm_Osag=uint8(double(Dcm_Osag1)/double(max(max(Dcm_Osag1)))*255);
figure(1)
T_Show_point( Dcm,CoorPoint );

Coor_Osag=imread('Coor_Osag10098822.bmp');
[ CoorPoint_Osag ] = T_Ext_ROI_Coordinate_Osag( Coor_Osag );
[ CoorPoint_Osagmm ] = T_Voxel2mm_Osag(CoorPoint_Osag,Dcm_Osag_Info);
figure(2)
T_Show_point_Osag( Dcm_Osag,CoorPoint_Osag );

figure(3)
[D]=T_TriShow_View_Osag(Roi,CoorPoint,Dcm,Info);


