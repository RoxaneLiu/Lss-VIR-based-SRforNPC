function [ OutDcm,OutInfo ] = T_ReadDicom( DictName,Sequence)
%�ú������ڶ�ȡROIͼ����Ҫ��png��ʽͼ��

DictName=sprintf('%s%s\\',DictName,Sequence);

fileStr=dir(strcat(DictName,'*.dcm'));%


fileNum=size(fileStr);
fileName=strcat(DictName,fileStr(1).name);
OutDcm=dicomread(fileName);
OutInfo(1)=dicominfo(fileName);

for i=2:fileNum
    fileName=strcat(DictName,fileStr(i).name);
    Roi=dicomread(fileName);
    OutInfo(i)=dicominfo(fileName);
    OutDcm=cat(3,OutDcm,Roi);    

end
end

