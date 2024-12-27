function [ OutDcm,OutInfo ] = T_ReadDicom( DictName,Sequence)
%该函数用于读取ROI图像，主要是png格式图像。

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

